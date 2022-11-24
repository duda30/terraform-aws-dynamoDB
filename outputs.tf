output "dynamodb_table_arn" {
  description = "ARN da tabela do DynamoDB"
  value       = try(aws_dynamodb_table.this[0].arn, aws_dynamodb_table.autoscaled[0].arn, "")
}

output "dynamodb_table_id" {
  description = "ID da tabela do DynamoDB"
  value       = try(aws_dynamodb_table.this[0].id, aws_dynamodb_table.autoscaled[0].id, "")
}

output "dynamodb_table_stream_arn" {
  description = "O ARN do Table Stream. Disponível apenas quando var.stream_enabled é verdadeiro"
  value       = var.stream_enabled ? try(aws_dynamodb_table.this[0].stream_arn, aws_dynamodb_table.autoscaled[0].stream_arn, "") : null
}

output "dynamodb_table_stream_label" {
  description = "Um carimbo de data/hora, no formato ISO 8601 do Table Stream. Disponível apenas quando var.stream_enabled é verdadeiro"
  value       = var.stream_enabled ? try(aws_dynamodb_table.this[0].stream_label, aws_dynamodb_table.autoscaled[0].stream_label, "") : null
}