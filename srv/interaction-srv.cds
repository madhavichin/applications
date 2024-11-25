using {my.demoapplication as my} from '../db/data-model';

@path: '/Admin'
service checklistServices {
    entity I_Plant             as projection on my.I_Plant;
     entity Equipment           as projection on my.Equipment;
    //not requ  entity plantdata     as projection on my.plantdata;
    @odata.draft.enabled
     entity DataSet as projection on my.DataSet;
}
