## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
|create_table    |   Controla se a tabela do DynamoDB e os recursos associados são criados   |   type=bool   |   default     = true|
|name    |   Nome da tabela do DynamoDB  |   type=string     |   default     = null|
|attributes  |   Lista de definições de atributos aninhados. Necessário apenas para os atributos hash_key e range_key. Cada atributo tem duas propriedades: nome - (Obrigatório) O nome do atributo, tipo - (Obrigatório) Tipo de atributo, que deve ser um tipo escalar: S, N ou B para (S)tring, (N)umber ou (B)inary data     |   default     = []|

hash_key    |   O atributo a ser usado como a chave de hash (partição). Também deve ser definido como um atributo   |   type=string     |   default     = null

range_key | O atributo a ser usado como a chave de intervalo (classificação). Também deve ser definido como um atributo | type        = string | default     = null

billing_mode | Controla como você é cobrado pela taxa de transferência de leitura/gravação e como você gerencia a capacidade. Os valores válidos são PROVISIONED ou PAY_PER_REQUEST | type        = string | default     = "PAY_PER_REQUEST"

write_capacity | O número de unidades de gravação para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0 | type        = number | default     = null

read_capacity | O número de unidades de leitura para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0 | type        = number | default     = null
