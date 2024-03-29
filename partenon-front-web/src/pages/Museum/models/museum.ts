import openingHours from './openingHours';
import contact from "./contact";
import exposition from "./exposition";
import appointment from "./appointment";
import tour from "./tour";

type museum = {
    basicData: {
        name: string,
        province: string,
        city: string,
        street: string,
        addressNumber: string,
        description: string,
        banner: Blob,
    },
    plan: Blob,
    contacts: contact[],
    openingHours: openingHours,
    expositions: exposition[],
    tours: tour[],
    appointments: appointment[]

}
export default museum;