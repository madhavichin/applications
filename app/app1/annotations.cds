using checklistServices as service from '../../srv/interaction-srv';
annotate service.DataSet with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Plant,
            },
            {
                $Type : 'UI.DataField',
                Value : equdata,
            },
            {
                $Type : 'UI.DataField',
                Label : 'plantname',
                Value : plantname,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Plant,
        },
        {
            $Type : 'UI.DataField',
            Value : equdata,
        },
        {
            $Type : 'UI.DataField',
            Label : 'plantname',
            Value : plantname,
        },
    ],
    UI.SelectionFields : [
        Plant,
        equdata,
    ],
);

