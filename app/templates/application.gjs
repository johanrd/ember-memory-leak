import RouteTemplate from "ember-route-template";
import { LinkTo } from "@ember/routing";

export default RouteTemplate(<template>

  <style>
    .font-bold {
      font-weight: bold;
    }
  </style>

  <h1>No memory leak with ember-intl = 6.2.2</h1>

  <nav style="font-family: monospace; display: flex; gap: 12px;">
    <LinkTo @route="dashboard" @activeClass="font-bold">Route with leaky component</LinkTo>
    <LinkTo @route="about" @activeClass="font-bold">Empty about</LinkTo>
  </nav>

  <main style="margin-top: 20px;">
    {{outlet}}
  </main>

</template>);
