

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
|create_table    |   Controla se a tabela do DynamoDB e os recursos associados são criados   |  `bool`   |    true|
|name    |   Nome da tabela do DynamoDB  |  `string`     |    null|
|attributes  |   Lista de definições de atributos aninhados. Necessário apenas para os atributos hash_key e range_key. Cada atributo tem duas propriedades: nome - (Obrigatório) O nome do atributo, tipo - (Obrigatório) Tipo de atributo, que deve ser um tipo escalar: S, N ou B para (S)tring, (N)umber ou (B)inary data     |`list(map(string))`|    []||
|hash_key    |   O atributo a ser usado como a chave de hash (partição). Também deve ser definido como um atributo   |  `string`     |    null|
|range_key | O atributo a ser usado como a chave de intervalo (classificação). Também deve ser definido como um atributo | `string` |  null|
|billing_mode | Controla como você é cobrado pela taxa de transferência de leitura/gravação e como você gerencia a capacidade. Os valores válidos são PROVISIONED ou PAY_PER_REQUEST |`string` |  PAY_PER_REQUEST|
|write_capacity | O número de unidades de gravação para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0 | `number` |  null|
|read_capacity | O número de unidades de leitura para esta tabela. Se o billing_mode for PROVISIONED, este campo deve ser maior que 0 | `number` |  null|
|point_in_time_recovery_enabled|Se deve habilitar a recuperação pontual|`bool`|false|
|ttl_enabled|Indica se ttl está ativado|`bool`|false|
|ttl_attribute_name|O nome do atributo da tabela para armazenar o timestamp TTL em|`string`|
|global_secondary_indexes|Descreva um GSI para a tabela; sujeito aos limites normais do número de GSIs, atributos projetados, etc.|any|
|local_secondary_indexes|Descreva um LSI na tabela; eles só podem ser alocados na criação, portanto, você não pode alterar essa definição depois de criar o recurso.|any|[]|
|replica_regions|Nomes de região para criar réplicas para uma tabela global do DynamoDB.|any|[]|
|stream_enabled|Indica se os Streams devem ser habilitados (true) ou desabilitados (false).|`bool`|false|
|stream_view_type|Quando um item na tabela é modificado, StreamViewType determina quais informações são gravadas no fluxo da tabela. Os valores válidos são KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES.|`string`|null|
|server_side_encryption_enabled|Habilitar ou não a criptografia em repouso usando uma chave mestra do cliente KMS gerenciada pela AWS (CMK)|`bool`|false|
|server_side_encryption_kms_key_arn|O ARN da CMK que deve ser usado para a criptografia do AWS KMS. Esse atributo só deve ser especificado se a chave for diferente da CMK padrão do DynamoDB, alias/aws/dynamodb.|`string`|null|
|tags||Um mapa de tags para adicionar a todos os recursos|`map(string)`|{}|
|timeouts|Tempo limite de gerenciamento de recursos do Terraform atualizado|``map(string)``|`{create = 10m, update = 60m, delete = 10m}`|
|autoscaling_enabled|Se deve ou não ativar o escalonamento automático. Veja a nota em README sobre esta configuração|`bool`|false|
|autoscaling_defaults|Um mapa das configurações de dimensionamento automático padrão|`map(string)`|`{scale_in_cooldown  = 0, scale_out_cooldown = 0, target_value       = 70}`|
|autoscaling_read|Um mapa de configurações de escalonamento automático de leitura. `max_capacity` é a única chave necessária. Veja o exemplo em exemplos/escalonamento automático|`map(string)`|`{}`|
|autoscaling_write|Um mapa das configurações de escalonamento automático de gravação. `max_capacity` é a única chave necessária. Veja o exemplo em exemplos/escalonamento automático|`map(string)`|`{}`|
|autoscaling_indexes|Um mapa de configurações de escalonamento automático de índice. Veja o exemplo em exemplos/escalonamento automático|`map(map(string))`|`{}`|
|table_class|A classe de armazenamento da tabela. Os valores válidos são STANDARD e STANDARD_INFREQUENT_ACCESS|`string`|null|
