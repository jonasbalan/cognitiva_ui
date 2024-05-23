class concursoOpenApiMetadataMock {
  static Map<String, dynamic> getData() => {
        "openapi": "3.0.1",
        "info": {"title": "Concurso API", "version": "v1"},
        "paths": {
          "/api/concurso/afro/config": {
            "get": {
              "tags": ["AfroConfig"],
              "parameters": [
                {
                  "name": "id",
                  "in": "query",
                  "schema": {"type": "string", "format": "uuid"}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "post": {
              "tags": ["AfroConfig"],
              "requestBody": {
                "content": {
                  "application/json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  },
                  "text/json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  },
                  "application/*+json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  }
                }
              },
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "put": {
              "tags": ["AfroConfig"],
              "requestBody": {
                "content": {
                  "application/json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  },
                  "text/json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  },
                  "application/*+json": {
                    "schema": {
                      "\$ref":
                          "#/components/schemas/ConcursoAfroConfigViewModel"
                    }
                  }
                }
              },
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "delete": {
              "tags": ["AfroConfig"],
              "parameters": [
                {
                  "name": "id",
                  "in": "query",
                  "schema": {"type": "string", "format": "uuid"}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            }
          },
          "/api/concurso/afro/config/paged": {
            "get": {
              "tags": ["AfroConfig"],
              "parameters": [
                {
                  "name": "pageSize",
                  "in": "query",
                  "schema": {
                    "type": "integer",
                    "format": "int32",
                    "default": 10
                  }
                },
                {
                  "name": "pageIndex",
                  "in": "query",
                  "schema": {"type": "integer", "format": "int32", "default": 0}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            }
          },
          "/api/Concurso": {
            "get": {
              "tags": ["Concurso"],
              "parameters": [
                {
                  "name": "id",
                  "in": "query",
                  "schema": {"type": "string", "format": "uuid"}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "post": {
              "tags": ["Concurso"],
              "requestBody": {
                "content": {
                  "application/json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  },
                  "text/json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  },
                  "application/*+json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  }
                }
              },
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "put": {
              "tags": ["Concurso"],
              "requestBody": {
                "content": {
                  "application/json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  },
                  "text/json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  },
                  "application/*+json": {
                    "schema": {
                      "\$ref": "#/components/schemas/ConcursoViewModel"
                    }
                  }
                }
              },
              "responses": {
                "200": {"description": "OK"}
              }
            },
            "delete": {
              "tags": ["Concurso"],
              "parameters": [
                {
                  "name": "id",
                  "in": "query",
                  "schema": {"type": "string", "format": "uuid"}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            }
          },
          "/api/Concurso/paged": {
            "get": {
              "tags": ["Concurso"],
              "parameters": [
                {
                  "name": "pageSize",
                  "in": "query",
                  "schema": {
                    "type": "integer",
                    "format": "int32",
                    "default": 10
                  }
                },
                {
                  "name": "pageIndex",
                  "in": "query",
                  "schema": {"type": "integer", "format": "int32", "default": 0}
                }
              ],
              "responses": {
                "200": {"description": "OK"}
              }
            }
          }
        },
        "components": {
          "schemas": {
            "ConcursoAfroConfigViewModel": {
              "title": "Config cotas Afro",
              "required": ["concursoId"],
              "type": "object",
              "properties": {
                "id": {
                  "title": "Id",
                  "type": "string",
                  "description": "Identificação das configurações",
                  "format": "uuid",
                  "example": "88e817e3-4d27-4bac-94d2-171e21b176a2"
                },
                "concursoId": {
                  "title": "Concurso Id",
                  "type": "string",
                  "description": "Identificação das concurso",
                  "format": "uuid",
                  "example": "bc471909-ab78-4d1c-899f-6f8a6c7a56b4"
                },
                "conBoPermiteCotaAfro": {
                  "title": "Cotas Afro",
                  "type": "boolean",
                  "description": "Habilita cotas para Afrodescendentes",
                  "example": "true"
                },
                "conInPercentualAfroConcurso": {
                  "title": "Percentual cotas Afro",
                  "type": "number",
                  "description": "Percetual de cotas para Afrodescendentes",
                  "format": "double",
                  "nullable": true,
                  "example": "15",
                  "input-sufix-label-enable": true,
                  "input-sufix-label": "%",
                  "input-prefix-label-enable": false,
                  "input-prefix-label": null
                },
                "conDtInicioCotaAfro": {
                  "title": "Início cotas Afro",
                  "type": "string",
                  "description":
                      "Data de início para solicitação das cotas Afrodescendentes",
                  "format": "date-time",
                  "nullable": true,
                  "example": "11/02/2024 12:00:00"
                },
                "conDtFimCotaAfro": {
                  "title": "Início cotas Afro",
                  "type": "string",
                  "description":
                      "Data de início para solicitação das cotas Afrodescendentes",
                  "format": "date-time",
                  "nullable": true,
                  "example": "11/02/2024 12:00:00"
                },
                // "concurso": {"\$ref": "#/components/schemas/ConcursoViewModel"}
              },
              "additionalProperties": false,
              "description": "Configurações sobre cotas para afrodescendentes"
            },
            "ConcursoStatusEnum": {
              "enum": ["Andamento", "Cancelado", "Homologacao", "Suspenso"],
              "type": "string"
            },
            "ConcursoViewModel": {
              "title": "Concurso",
              "required": ["customerId", "editalId", "nome"],
              "type": "object",
              "properties": {
                "id": {
                  "title": "Id",
                  "type": "string",
                  "description": "Identificação do concurso",
                  "format": "uuid",
                  "example": "bc471909-ab78-4d1c-899f-6f8a6c7a56b4"
                },
                "customerId": {
                  "title": "Cliente Id",
                  "type": "string",
                  "description": "Identificação do cliente",
                  "format": "uuid",
                  "example": "1d1026e2-0741-488f-b308-dfc4696dafe5"
                },
                "nome": {
                  "title": "Nome",
                  "minLength": 1,
                  "type": "string",
                  "description": "Nome do concurso",
                  "example": "Concurso Prefeitura XPTO"
                },
                "editalId": {
                  "title": "Edital",
                  "minLength": 1,
                  "type": "string",
                  "description": "Identificação do Edital",
                  "example": "Nº01/2024"
                },
                "dataPublicacaoEdital": {
                  "title": "Publicação do edital",
                  "type": "string",
                  "description": "Data da publicação do edital",
                  "format": "date-time",
                  "nullable": true,
                  "example": "10/02/2024 07:00:00"
                },
                "status": {"\$ref": "#/components/schemas/ConcursoStatusEnum"},
                "aviso": {
                  "title": "Aviso",
                  "type": "string",
                  "description": "Aviso sobre o concurso",
                  "nullable": true,
                  "example": "Nova versão do Edital dísponivel"
                },
                "paymentContractId": {
                  "title": "Contrato de pagamento",
                  "type": "string",
                  "description":
                      "Identificador do contrato de pagamento utilizado por esse concurso ",
                  "format": "uuid",
                  "nullable": true,
                  "example": "5bba11ab-0eb2-401e-a84b-bc9bde9c478a"
                },
                "afroConfig": {
                  "\$ref": "#/components/schemas/ConcursoAfroConfigViewModel"
                }
              },
              "additionalProperties": false,
              "description": "Dados do concurso"
            }
          }
        }
      };
}
