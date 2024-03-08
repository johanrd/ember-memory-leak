import RouteTemplate from "ember-route-template";

import LeakyIntlConsumingComponent from 'ember-memory-leak/components/leaky-intl-consuming-component'
import t from 'ember-intl/helpers/t';


export default RouteTemplate(<template>

    <LeakyIntlConsumingComponent
      @title={{t 'Character heights'}}
    />

</template>);
