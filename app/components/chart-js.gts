import Component from '@glimmer/component'
import { action } from '@ember/object'
import { modifier } from 'ember-modifier'

import {
  Chart,
  BarController,
  LineController,
  ScatterController,
  LineElement,
  PointElement,
  BarElement,
  TimeScale,
  LinearScale,
  TimeSeriesScale,
  CategoryScale,
  ChartOptions,
  ChartType,
  ChartData,
  Tooltip,
  Filler,
} from 'chart.js'

Chart.register(
  BarController,
  LineController,
  ScatterController,
  LineElement,
  PointElement,
  BarElement,
  TimeScale,
  LinearScale,
  CategoryScale,
  Tooltip,
  Filler,
  TimeSeriesScale,
)

interface ChartJsSignature {
  Element: HTMLCanvasElement
  Args: {
    data: ChartData
    isLoading?: boolean
    title?: string
  }
}

export default class ChartJsComponent extends Component<ChartJsSignature> {
  chart?: Chart

  renderChart = modifier((element: HTMLCanvasElement, [data, isLoading]: [ChartData, boolean]) => {
    if (!this.chart) {
      const canvas = element
      const context = canvas.getContext('2d') as CanvasRenderingContext2D
      const chart = new Chart(context, {
        type: 'bar',
        data: data,
      })
      this.chart = chart
    } else if (!isLoading) {
      this.chart.data = data
      this.chart?.update()
    }
  })
  
  willDestroy() {
    super.willDestroy()
    this.chart?.destroy()
  }


  <template>
    <canvas
      {{this.renderChart @data @isLoading}}
      ...attributes
      class='chartjs-render-monitor'
    />
  </template>
}
