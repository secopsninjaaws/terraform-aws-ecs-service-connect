<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_appautoscaling_policy.CPU_scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.CPU_scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory_scale_in](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory_scale_out](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.CPU_scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.CPU_scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_scale_in_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_scale_out_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.task_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.task_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.task_execution_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.task_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rule_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_service_discovery_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | A estratégia de capacidade para o serviço ECS | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = number<br/>  }))</pre> | <pre>[<br/>  {<br/>    "capacity_provider": "FARGATE_SPOT",<br/>    "weight": 100<br/>  }<br/>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | O nome do cluster ECS | `string` | n/a | yes |
| <a name="input_compatibilities"></a> [compatibilities](#input\_compatibilities) | O tipo de inicialização que a definição da task deve usar | `list(string)` | <pre>[<br/>  "FARGATE"<br/>]</pre> | no |
| <a name="input_ecr_image_tag"></a> [ecr\_image\_tag](#input\_ecr\_image\_tag) | A tag da imagem para o repositório ECR | `string` | `"latest"` | no |
| <a name="input_efs_volumes"></a> [efs\_volumes](#input\_efs\_volumes) | Volumes EFS para o ECS | <pre>list(object({<br/>    name               = string<br/>    file_system_id     = string<br/>    root_directory     = string<br/>    transit_encryption = bool<br/>  }))</pre> | `[]` | no |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | O ID do namespace | `string` | n/a | yes |
| <a name="input_path_health_check"></a> [path\_health\_check](#input\_path\_health\_check) | O caminho para o health check | `map(any)` | <pre>{<br/>  "healthy_threshold": 2,<br/>  "interval": 30,<br/>  "matcher": "200-399",<br/>  "path": "/",<br/>  "port": 80,<br/>  "protocol": "HTTP",<br/>  "timeout": 15,<br/>  "unhealthy_threshold": 2<br/>}</pre> | no |
| <a name="input_placement_strategy"></a> [placement\_strategy](#input\_placement\_strategy) | A estratégia de colocação para o serviço ECS | <pre>list(object({<br/>    type  = string<br/>    field = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "field": "cpu",<br/>    "type": "binpack"<br/>  }<br/>]</pre> | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | As subnets privadas onde o serviço ECS será implantado | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | O nome do projeto | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | O protocolo de rede | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | A região da AWS para implantar o serviço ECS | `string` | `"us-east-1"` | no |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | O valor de ajuste para scale in | `number` | `-1` | no |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | O operador de comparação para scale in | `string` | `"LessThanOrEqualToThreshold"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | O período de cooldown para scale in | `number` | `60` | no |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | O limite de utilização de CPU para scale in | `number` | `60` | no |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | O número de períodos de avaliação para scale in | `number` | `2` | no |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | O período para scale in | `number` | `180` | no |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | A estatística a ser usada para scale in | `string` | `"Average"` | no |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | O valor de ajuste para scale out | `number` | `1` | no |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | O operador de comparação para scale out | `string` | `"GraterThanOrEqualToThreshold"` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | O período de cooldown para scale out | `number` | `120` | no |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | O limite de utilização de CPU para scale out | `number` | `70` | no |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | O número de períodos de avaliação para scale out | `number` | `1` | no |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | O período para scale out | `number` | `60` | no |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | A estatística a ser usada para scale out | `string` | `"Average"` | no |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | O tipo de política de escalabilidade a ser usada | `string` | n/a | yes |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | As regras de security group para o serviço ECS | <pre>map(object({<br/>    type        = string<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>  }))</pre> | <pre>{<br/>  "http": {<br/>    "cidr_blocks": [<br/>      "0.0.0.0/0"<br/>    ],<br/>    "from_port": 80,<br/>    "protocol": "tcp",<br/>    "to_port": 80,<br/>    "type": "ingress"<br/>  }<br/>}</pre> | no |
| <a name="input_service_connect_name"></a> [service\_connect\_name](#input\_service\_connect\_name) | O nome do Service Connect | `string` | n/a | yes |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | As unidades de CPU para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_desired_count"></a> [service\_desired\_count](#input\_service\_desired\_count) | O número desejado de tarefas para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_max_count"></a> [service\_max\_count](#input\_service\_max\_count) | O número máximo de tarefas para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | A memória (em MiB) para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_min_count"></a> [service\_min\_count](#input\_service\_min\_count) | O número mínimo de tarefas para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | O nome do serviço ECS | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | A porta para o serviço ECS | `number` | n/a | yes |
| <a name="input_service_protocol"></a> [service\_protocol](#input\_service\_protocol) | O protocolo para o serviço | `string` | n/a | yes |
| <a name="input_task_execution_role_policy_actions"></a> [task\_execution\_role\_policy\_actions](#input\_task\_execution\_role\_policy\_actions) | valores para as ações da política da role de execução da task | `list(string)` | <pre>[<br/>  "ecr:GetAuthorizationToken",<br/>  "ecr:BatchCheckLayerAvailability",<br/>  "ecr:GetDownloadUrlForLayer",<br/>  "ecr:BatchGetImage",<br/>  "logs:CreateLogStream",<br/>  "logs:PutLogEvents",<br/>  "s3:GetBucketLocation",<br/>  "kms:Decrypt",<br/>  "secretsmanager:GetSecretValue"<br/>]</pre> | no |
| <a name="input_task_role_policy_actions"></a> [task\_role\_policy\_actions](#input\_task\_role\_policy\_actions) | valores para as ações da política da role da task | `list(string)` | <pre>[<br/>  "ssmmessages:CreateControlChannel",<br/>  "ssmmessages:CreateDataChannel",<br/>  "ssmmessages:OpenControlChannel",<br/>  "ssmmessages:OpenDataChannel"<br/>]</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | O ID da VPC onde o serviço ECS será implantado | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->