import RouteTemplate from "ember-route-template";
import { LinkTo } from "@ember/routing";

export default RouteTemplate(<template>

  <h1>Ember Memory Leak</h1>

  <nav>
    <LinkTo @route="dashboard">Leaky dashboard</LinkTo>
    <LinkTo @route="about">Empty about</LinkTo>
  </nav>

  <main style="margin-top: 20px;">
    {{outlet}}
  </main>

</template>);
