import Component from "@glimmer/component";
import ChartJs from 'ember-memory-leak/components/chart-js'
import { or } from 'ember-truth-helpers';
import { t } from 'ember-intl';

type Character = {
    name: string;
    height: string; // Height is a string in your dataset, but we'll convert it to number
};

type SWAPIData = {
    count: number;
    next: string | null;
    previous: string | null;
    results: Character[];
};

// Function to convert dataset to Chart.js data format
function convertToChartData(data?: SWAPIData): { labels: string[]; datasets: any[] } {
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
      datasets: [{
          label: 'Character Heights',
          data: dataset.map(d => d.y),
          backgroundColor: dataset.map((_, index) => backgroundColors[index % backgroundColors.length])
      }]
    };
}


export default class Dashboard extends Component {
  <template>
    <ul>
      <li>People: {{or @peopleList.results.length 'loading…'}}</li>
      <li>vehicles: {{or @vehicleList.results.length 'loading…'}}</li>
    </ul>

    <ChartJs
      style="width: 100%; height: 300px; margin-top: 40px;"
      @type="bar"
      @data={{convertToChartData @peopleList}}
      @isLoading={{@isLoading}}
      @title={{t 'Character heights'}}
    />
  </template>
}
