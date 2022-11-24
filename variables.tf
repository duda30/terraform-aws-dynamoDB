variable "create_table" {
  description = "Controla se a tabela do DynamoDB e os recursos associados são criados"
  type        = bool
  default     = true
}

variable "name" {
  description = "Nome da tabela do DynamoDB"
  type        = string
  default     = null
}

variable "attributes" {
  description = "Lista de definições de atributos aninhados. Necessário apenas para os atributos hash_key e range_key. Cada atributo tem duas propriedades: nome - (Obrigatório) O nome do atributo, tipo - (Obrigatório) Tipo de atributo, que deve ser um tipo escalar: S, N ou B para (S)tring, (N)umber ou (B)inary data"
  type        = list(map(string))
  default     = []
}

variable "hash_key" {
  description = "O atributo a ser usado como a chave de hash (partição). Também deve ser definido como um atributo"
  type        = string
  default     = null
}

variable "range_key" {
  description = "O atributo a ser usado como a chave de intervalo (classificação). Também deve ser definido como um atributo"
  type        = string
  default     = null
}

variable "billing_mode" {
  description = "Controla como você é cobrado pela taxa de transferência de leitura/gravação e como você gerencia a capacidade. Os valores válidos são PROVISIONED ou PAY_PER_REQUEST"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "write_capacity" {
  description = "O número de unidades de gravação para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0"
  type        = number
  default     = null
}

variable "read_capacity" {
  description = "O número de unidades de leitura para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0"
  type        = number
  default     = null
}

variable "point_in_time_recovery_enabled" {
  description = "Se deve habilitar a recuperação pontual"
  type        = bool
  default     = false
}

variable "ttl_enabled" {
  description = "Indica se ttl está ativado"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "O nome do atributo da tabela para armazenar o timestamp TTL em"
  type        = string
  default     = ""
}

variable "global_secondary_indexes" {
  description = "Descreva um GSI para a tabela; sujeito aos limites normais do número de GSIs, atributos projetados, etc."
  type        = any
  default     = []
}

variable "local_secondary_indexes" {
  description = "Descreva um LSI na tabela; eles só podem ser alocados na criação, portanto, você não pode alterar essa definição depois de criar o recurso."
  type        = any
  default     = []
}

variable "replica_regions" {
  description = "Nomes de região para criar réplicas para uma tabela global do DynamoDB."
  type        = any
  default     = []
}

variable "stream_enabled" {
  description = "Indica se os Streams devem ser habilitados (true) ou desabilitados (false)."
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "Quando um item na tabela é modificado, StreamViewType determina quais informações são gravadas no fluxo da tabela. Os valores válidos são KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
  default     = null
}

variable "server_side_encryption_enabled" {
  description = "Habilitar ou não a criptografia em repouso usando uma chave mestra do cliente KMS gerenciada pela AWS (CMK)"
  type        = bool
  default     = false
}

variable "server_side_encryption_kms_key_arn" {
  description = "O ARN da CMK que deve ser usado para a criptografia do AWS KMS. Esse atributo só deve ser especificado se a chave for diferente da CMK padrão do DynamoDB, alias/aws/dynamodb."
  type        = string
  default     = null
}

variable "tags" {
  description = "Um mapa de tags para adicionar a todos os recursos"
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = "Tempo limite de gerenciamento de recursos do Terraform atualizado"
  type        = map(string)
  default = {
    create = "10m"
    update = "60m"
    delete = "10m"
  }
}

variable "autoscaling_enabled" {
  description = "Se deve ou não ativar o escalonamento automático. Veja a nota em README sobre esta configuração"
  type        = bool
  default     = false
}

variable "autoscaling_defaults" {
  description = "Um mapa das configurações de dimensionamento automático padrão"
  type        = map(string)
  default = {
    scale_in_cooldown  = 0
    scale_out_cooldown = 0
    target_value       = 70
  }
}

variable "autoscaling_read" {
  description = "Um mapa de configurações de escalonamento automático de leitura. `max_capacity` é a única chave necessária. Veja o exemplo em exemplos/escalonamento automático"
  type        = map(string)
  default     = {}
}

variable "autoscaling_write" {
  description = "Um mapa das configurações de escalonamento automático de gravação. `max_capacity` é a única chave necessária. Veja o exemplo em exemplos/escalonamento automático"
  type        = map(string)
  default     = {}
}

variable "autoscaling_indexes" {
  description = "Um mapa de configurações de escalonamento automático de índice. Veja o exemplo em exemplos/escalonamento automático"
  type        = map(map(string))
  default     = {}
}

variable "table_class" {
  description = "A classe de armazenamento da tabela. Os valores válidos são STANDARD e STANDARD_INFREQUENT_ACCESS"
  type        = string
  default     = null
}