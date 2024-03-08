import Component from '@glimmer/component'

interface LeakyIntlConsumingComponentSignature {
  Args: {
    title?: string
  }
}

export default class LeakyIntlConsumingComponent extends Component<LeakyIntlConsumingComponentSignature> {
  <template>
    Hello, am the LeakyComponent. I am not consuming the @title attribute, yet I am kept in memory after teardown of the component. This is a memory leak.
  </template>
}
