import Component from "@glimmer/component";
import { use } from "ember-resources";
import { RemoteData } from "reactiveweb/remote-data";
import { keepLatest } from "reactiveweb/keep-latest";

export default class PeopleList extends Component {
  @use request = RemoteData(() => "https://swapi.tech/api/people");

  @use latest = keepLatest({
    value: () => this.request.value,
    when: () => this.request.isLoading,
  });

  <template>
    {{yield this.latest this.request}}
  </template>
}
