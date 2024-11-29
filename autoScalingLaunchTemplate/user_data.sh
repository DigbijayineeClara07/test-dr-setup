#cloud-config
repo_update: true
repo_upgrade: security
runcmd:
  - echo "ECS_CLUSTER=admin-workflow-qa" >> /etc/ecs/ecs.config
  - echo "ECS_BACKEND_HOST=" >> /etc/ecs/ecs.config
  - echo 'ECS_INSTANCE_ATTRIBUTES={"type":"shared"}' >> /etc/ecs/ecs.config
output: { all : '| tee -a /var/log/cloud-init-output.log' }
final_message: "The system is finally up, after $UPTIME seconds"
