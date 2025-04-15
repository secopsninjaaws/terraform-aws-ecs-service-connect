resource "aws_ecs_service" "main" {
  name            = "${var.service_name}-service"
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.service_desired_count

  network_configuration {
    subnets          = var.private_subnets
    security_groups  = [aws_security_group.main.id]
    assign_public_ip = false
  }

  service_registries {
    registry_arn = aws_service_discovery_service.main.arn
  }

  service_connect_configuration {
    enabled   = true
    namespace = var.service_connect_name
    service {
      port_name      = var.service_name
      discovery_name = var.service_name
      client_alias {
        port     = var.service_port
        dns_name = "${var.service_name}.${var.service_connect_name}"

      }

    }


  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
    }

  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200


  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count
    ]
  }

  tags = {
    Name = "${var.service_name}-service"
  }

}





