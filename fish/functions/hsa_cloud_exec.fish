function hsa_cloud_exec --argument container command
    if not set -q command
      set -f command bash
    end

    if not set -q container
      set -f container http
    end

    command -q aws
      or return

    echo "Going to run $command in container: $container...."

    set -l cluster_arn (command aws ecs list-clusters | jq -r '.clusterArns[0]')
    echo "Got Cluster: $cluster_arn"

    set -l service_arn (command aws ecs list-services --cluster=$cluster_arn | jq -r '.serviceArns | map(select(. | contains("HSA")))' | string replace -ar "\[|\]|\"|\s" "" | string split -n ",")
    echo "Got Service(s): "
    printf \t%s\n $service_arn

    if test (count $service_arn) -gt 1
        if string match -ir "http|websocket|nginx" $container
            for sarn in $service_arn
                if string match -irv "worker" $sarn
                    set -f user_selected_service_arn $sarn
                    break
                end
            end
        else if string match -ir "^worker" $container
            for sarn in $service_arn
                if string match -ir "worker" $sarn
                    set -f user_selected_service_arn $sarn
                    break
                end
            end
        else if isatty stdin
            and isatty stdout
            read -f user_selected_service_arn --prompt-str="Please enter the service arn to use: "
        else
            echo "Unsure what to do with the listed service arns and will exit. ARNs: $service_arn"
            exit 1
        end
    else
      echo "Only one service ARN available, using that."
      set -f user_selected_service_arn (command echo $service_arn | grep arn | tr '\n' ' ' | sed s/\"//g | sed /,//g | string trim)
    end
    echo "Proceeding with ECS Service ARN:"
    printf \t%s\n $user_selected_service_arn

    set -l task_arn (command aws ecs list-tasks --cluster=$cluster_arn --service-name=$user_selected_service_arn | grep arn | sed s/\"//g | sed s/,//g)
    echo "Got Tasks: "
    printf %s\n $task_arn

    if test (count $task_arn) -gt 1
        and isatty stdin
        and isatty stdout
      read -f user_selected_arn --prompt-str="Please enter the task arn to use: "
    else
      echo "Only one task ARN available, using that."
      set -f user_selected_arn (command echo $task_arn | grep arn | tr '\n' ' ' | sed s/\"//g | sed s/,//g | string trim)
    end

    command aws ecs execute-command --cluster=$cluster_arn --task=$user_selected_arn --container="$container" --command="$command" --interactive
end

