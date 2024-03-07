import RouteTemplate from "ember-route-template";
import PeopleList from "ember-memory-leak/components/people-list";
import VehicleList from "ember-memory-leak/components/vehicle-list";
import Dashboard from "ember-memory-leak/components/dashboard";
import { or } from "ember-truth-helpers";

export default RouteTemplate(<template>

  <PeopleList as |peopleList peopleRequest|>
    <VehicleList as |vehicleList vehicleRequest|>
      <Dashboard @peopleList={{peopleList}} @vehicleList={{vehicleList}} @isLoading={{or peopleRequest.isLoading vehicleRequest.isLoading}}/>
    </VehicleList>
  </PeopleList>

  {{outlet}}

</template>);
