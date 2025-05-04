{
  title: 'Star Wars Information',

  connection: {
    fields: [
      {
        name: "object",
        hint: "Enter the object you plan to use to test your connection.",
      }
    ]
  },

  test: lambda do |connection|
    get("https://swapi.tech/api/#{connection["object"]}")
  end,

  actions: {
    get_person_by_id: {
      input_fields: lambda do
          [{
            name: 'id',
            label: 'Person ID',
            type: 'integer',
            default: '1',
            optional: false
          }]
        end,

      execute: lambda do | connection, input |
        get("https://swapi.tech/api/people/#{input["id"]}")
      end,

      output_fields: lambda do
          [{
              name: "message",
              label: "Message",
              type: "string"
            },
            {
              name: "result",
              label: "Result",
              type: "object",
              properties: [{
                  name: "properties",
                  label: "Properties",
                  type: "object",
                  properties: [{
                      name: "height",
                      label: "Height",
                      type: "string"
                    },
                    {
                      name: "mass",
                      label: "Mass",
                      type: "string"
                    },
                    {
                      name: "hair_color",
                      label: "Hair color",
                      type: "string"
                    },
                    {
                      name: "skin_color",
                      label: "Skin color",
                      type: "string"
                    },
                    {
                      name: "eye_color",
                      label: "Eye color",
                      type: "string"
                    },
                    {
                      name: "birth_year",
                      label: "Birth year",
                      type: "string"
                    },
                    {
                      name: "gender",
                      label: "Gender",
                      type: "string"
                    },
                    {
                      name: "created",
                      label: "Date created",
                      type: "date_time"
                    },
                    {
                      name: "edited",
                      label: "Date edited",
                      type: "date_time"
                    },
                    {
                      name: "name",
                      label: "Person name",
                      type: "string"
                    },
                    {
                      name: "homeworld",
                      label: "Homeworld",
                      type: "string"
                    },
                    {
                      name: "url",
                      label: "URL",
                      type: "string"
                    }
                  ]
                },
                {
                  name: "description",
                  label: "Description",
                  type: "string"
                },
                {
                  name: "_id",
                  type: "string"
                },
                {
                  name: "uid",
                  type: "string"
                },
                {
                  name: "__v",
                  type: "integer"
                }
              ]
            }
          ]
        end,
    },
  }
}
