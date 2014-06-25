window.Highcharts || {}
window.Highcharts.createKnowledgeGraph = (options={}) ->
  renderTo = options['renderTo'] || throw "key renderTo is required, expected to match an element's attr id"
  knowledges = options['knowledges'] || throw "key knowledges is required, expected to be a list of knowledges names"
  hovers = options['hovers'] || throw "key hovers is required, expected to be a list of hovers names"
  values = options['values'] || throw "key knowledges is required, expected to be a list of knowledges integers in [0..10] range"
  levels = options['levels'] || ['Rookie', 'Good', 'Quite Good']

  completeOptions =
    credits:
      enabled: false
    chart:
      renderTo: renderTo
      type: 'column'
      height: 330
      marginLeft: 50
    title:
      text: false
    legend:
      enabled: false
    xAxis:
      title:
        text: null
      categories: knowledges
      gridLineColor: 'transparent'
      labels:
        rotation: -45
        style:
          fontFamily: 'OpenSans-Regular'
    yAxis:
      title:
        text: null
      labels:
        style:
          fontFamily: 'OpenSans-Regular'
        formatter: ->
          return "" if @value == 0
          previous = 0
          next = 10/levels.length
          for level in levels
            if @value > previous && @value <= next
              return level
            previous += 10/levels.length
            next += 10/levels.length
      min: 0
      max: 10
      tickInterval: 10/levels.length
      lineColor: '#B6B2A7'
      lineWidth: 1
      gridLineColor: 'transparent'
    series: [
      data: values
      color: '#555'
    ]
    plotOptions:
      series:
        borderColor: '#303030'
      animation: true
    tooltip:
      valueSuffix: '',
      formatter: ->
        hovers[@point.x]

  new Highcharts.Chart(completeOptions)
