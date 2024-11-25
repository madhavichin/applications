namespace my.demoapplication;

using {
    cuid,
    managed
} from '@sap/cds/common';

using {API_PLANT_SRV as ApiPlant} from '../srv/external/API_PLANT_SRV.csn';
using {API_EQUIPMENT as external} from '../srv/external/API_EQUIPMENT.csn';
// using { Plant_OnPrem as plantonprem} from '../srv/external/Plant_OnPrem.csn';
//  entity plantdata as projection on plantonprem.A_Plant;


entity I_Plant             as projection on ApiPlant.ZIPLANT_DATA;
 entity Equipment as projection on external.Equipment {
   key  Equipment    , EquipmentName   ,MaintenancePlant,
        FunctionalLocation,
        FunctionalLocationName      
}
entity DataSet:cuid {
key Plant : String(50);
equdata :String(50);
plantname :String(50);
}
annotate my.demoapplication.DataSet with {
    Plant                 @(
        title                          : 'Plant',
        SearchSupported                : true,
        Common.ValueListWithFixedValues: false,
        //Common.Text                    : PlantName,
        Common.ValueList               : {
            CollectionPath: 'I_Plant',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    ValueListProperty: 'Plant',
                    LocalDataProperty: Plant
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    ValueListProperty: 'PlantName',
                    LocalDataProperty: Plant
                }
            ]
        }
    );

    equdata            @(
               title                          : 'Equipment',
        SearchSupported                : true,
        Common.ValueListWithFixedValues: false,
      //  Common.Text                    : EquipmentName,
        Common.ValueList               : {
            CollectionPath: 'Equipment',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    ValueListProperty: 'Equipment',
                    LocalDataProperty: equdata
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    ValueListProperty: 'EquipmentName',
                    LocalDataProperty: equdata
                },
                {
                    $Type            : 'Common.ValueListParameterIn',
                    ValueListProperty: 'MaintenancePlant',
                    LocalDataProperty: Plant
                },  
            ]
        }
    );
}