function cloudy_figgy_exec --argument site_id command container
    if not set -q container
      set -l container http
    end

    echo "Going to run $command on $site_id's container: $container...."
    set -l cluster_arn (aws ecs list-clusters | jq -r '.clusterArns | map(select(. | contains("'$site_id'")))[0]')
    echo "Got Cluster: $cluster_arn"
    set -l service_arn (aws ecs list-services --cluster=$cluster_arn | jq -r '.serviceArns | map(select(. | contains("HSA")))[0]')
    echo "Got Service: $service_arn"
    set -l task_arn (aws ecs list-tasks --cluster=$cluster_arn --service-name=$service_arn |  jq -r '.taskArns[0]')
    echo "Got Task:    $task_arn"

    aws ecs execute-command --cluster=$cluster_arn --task=$task_arn --container="$container" --command="$command" --interactive
end
