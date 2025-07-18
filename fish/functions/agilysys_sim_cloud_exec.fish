function agilysys_sim_cloud_exec --argument container
    if not set -q command
        set -f command bash
    end
    command -q aws
    or return
    echo "Going to run '$command' in the Agilysys Sim's http container"
    set -l cluster_arn (command aws ecs list-clusters | jq -r '.clusterArns[] | select(contains("Agilysys"))')
    echo "Got cluster: $cluster_arn"
    set -l service_arn (command aws ecs list-services --cluster=$cluster_arn | jq -r '.serviceArns[0]')
    echo "Got service: $service_arn"
    set -l task_arn (command aws ecs list-tasks --cluster=$cluster_arn --service-name=$service_arn | jq -r '.taskArns[0]')
    echo "Got task: $task_arn"
    echo "Executing command: 'aws ecs execute-command --cluster=$cluster_arn --task=$task_arn --container=http-container --command="$command" --interactive'"
    command aws ecs execute-command --cluster=$cluster_arn --task=$task_arn --container=http-container --command="$command" --interactive
end