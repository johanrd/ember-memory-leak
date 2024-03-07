import Component from '@glimmer/component'
import { action } from '@ember/object'
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

// import 'chartjs-adapter-dayjs-3'

import { on } from '@ember/modifier'
import { or } from 'ember-truth-helpers'
import didInsert from '@ember/render-modifiers/modifiers/did-insert'
import didUpdate from '@ember/render-modifiers/modifiers/did-update'
import { tracked } from '@glimmer/tracking'

interface ChartJsSignature {
  Element: HTMLCanvasElement
  Args: {
    type?: ChartType
    data: ChartData
    options?: ChartOptions
    isLoading?: boolean
    title?: string
    onMouseLeave?: () => void
  }
}

function noop() {
  return function () {}
}


export default class ChartJsComponent extends Component<ChartJsSignature> {
  @tracked chart: Chart | undefined = undefined

  @action
  setupChart(element: HTMLCanvasElement) {
    const canvas = element
    const context = canvas.getContext('2d') as CanvasRenderingContext2D
    const chart = new Chart(context, {
      type: this.args.type || 'bar',
      data: this.args.data,
      options: this.args.options,
    })
    this.chart = chart
  }

  @action
  updateChart() {
    if (this.args.isLoading) return
    this.chart.data = this.args.data
    this.chart?.update()
  }

  willDestroy() {
    super.willDestroy()
    this.chart?.destroy()
  }

  <template>
    {{@title}}
    <canvas
      ...attributes
      class='chartjs-render-monitor'
      {{didInsert this.setupChart}}
      {{didUpdate this.updateChart @data}}
      {{on 'mouseleave' (or @onMouseLeave (noop))}}
    />
  </template>
}
