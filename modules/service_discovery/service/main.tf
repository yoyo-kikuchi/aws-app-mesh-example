resource "aws_service_discovery_service" "template" {
  name = var.name

  dns_config {
    namespace_id = var.namespace_id
    dns_records {
      ttl  = var.dns_records_ttl
      type = var.dns_records_type
    }
    routing_policy = var.routing_policy
  }

  health_check_custom_config {
    failure_threshold = var.failure_threshold
  }
}
