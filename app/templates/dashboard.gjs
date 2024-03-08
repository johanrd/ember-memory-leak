import RouteTemplate from "ember-route-template";
import PeopleList from "ember-memory-leak/components/people-list";
import Dashboard from "ember-memory-leak/components/dashboard";

import ChartJs from 'ember-memory-leak/components/chart-js'
import t from 'ember-intl/helpers/t';
import type { ChartData } from 'chart.js';

type Character = {
  name: string;
};

type SWAPIData = {
  count: number;
  results: Character[];
};

// Convert swapi dataset to Chart.js format
function convertSwapiResponseToChartJsData(data?: SWAPIData): ChartData<'bar'> {
  if (!data) return { labels: [], datasets: [] };

  const backgroundColors = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'];
  
  const labels = data?.results.map(character => character.name);
  const dataset = data?.results.map(character => {
    return {
      x: character.name,
      y: character.name.length
    };
  });

  return {
    labels: labels,
    datasets: [
      {
        label: 'Character heights',
        data: dataset.map(d => d.y),
        backgroundColor: dataset.map((_, index) => backgroundColors[index % backgroundColors.length])
      }
    ]
  };
}

export default RouteTemplate(<template>

  <PeopleList as |peopleList peopleRequest|>
    <ul>
      <li>People: {{#if peopleRequest.isLoading}}loading data…{{else}} {{peopleList.results.length}}{{/if}}</li>
    </ul>

    <ChartJs
      style="width: 100%; height: 300px; margin-top: 40px;"
      @type="bar"
      @data={{convertSwapiResponseToChartJsData peopleList}}
      @isLoading={{peopleRequest.isLoading}}
      @title={{t 'Character heights'}}
    />
  </PeopleList>

</template>);
