let cds = require('@sap/cds');
let { Console } = require('console');
module.exports = cds.service.impl(async function (srv) {
  let { Equ, Equipment, I_Plant, FunctionalLocation, MaintenanceTaskList, MaintenanceOrder, Manageorders, GetOrders, HeaderItems, ChecklistItems, ChecklistNumber } = this.entities;
  let db = await cds.connect.to("db");
  let ApiPlant = await cds.connect.to("API_PLANT_SRV");
   let ApiEquipment = await cds.connect.to("API_EQUIPMENT");
  srv.on('READ', Equipment, async (req) => {
    return await ApiEquipment.tx(req).run(req.query);
  });
 
  srv.on('READ', 'I_Plant', async req => {
    return await ApiPlant.run(req.query);
  });
  srv.before('NEW', 'DataSet.drafts', async (req) => {
    let { Plant } = req.data;
    let plant = req.data.Plant;
    console.log("plant is fetched :" + plant);
    let filterplant = await ApiPlant.run(SELECT.from(I_Plant).where({ Plant: plant }));
    // let PlantName = filterplant[0].PlantName;
    // req.data.PlantName = PlantName;
    console.log(filterplant)
    if (filterplant.length === 0) {
      // console.log("plant is fetched from fonloc IN IF LOOP CONDITION:" + plant);
      req.error(400, `Please provide valid Plant`);
    }
  });
srv.on('CREATE', 'DataSet', async req => {
  const { Plant, equdata } = req.data;
  //added below code 
  const result = await INSERT.into(this.entities.DataSet).entries({ Plant, equdata });
  return result;
});

//   const onpremservice = await cds.connect.to("Plant_OnPrem");

//   this.on('READ', ['plantdata'] , async (req) => {
//     return await onpremservice.tx(req).run(req.query);
// });
//package.json file data for onpremis
// "Plant_OnPrem": {
//     "kind": "odata-v2",
//     "model": "srv/external/Plant_OnPrem",
//     "csrf": true,
//     "csrfInBatch": true,
//     "[sandbox]": {
//       "credentials": {
//         "path": "/sap/opu/odata/sap/API_PLANT_SRV",
//         "destination": "F4D_400_CLONING_RP1",
//         "forwardAuthToken": true
//       }
//     },
//     "[hybrid]": {
//      "credentials": {
//         "path": "/sap/opu/odata/sap/API_PLANT_SRV",
//         "destination": "F4D_400_CLONING_RP1",
//         "forwardAuthToken": true
//       }
//     },
//     "[production]": {
//      "credentials": {
//         "path": "/sap/opu/odata/sap/API_PLANT_SRV",
//         "destination": "F4D_400_CLONING_RP1",
//         "forwardAuthToken": true
//       }
//     }
//   }
});