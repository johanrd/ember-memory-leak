import RouteTemplate from "ember-route-template";
import { LinkTo } from "@ember/routing";
import { t } from "ember-intl";

export default RouteTemplate(<template>

  <h1>Ember Memory Leak</h1>

  <nav>
    <LinkTo @route="dashboard">{{t 'Leaky dashboard'}}</LinkTo>
    <LinkTo @route="about">{{t 'Empty about'}}</LinkTo>
  </nav>

  <main style="margin-top: 20px;">
    {{outlet}}
  </main>

</template>);
