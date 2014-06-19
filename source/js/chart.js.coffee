window.Highcharts || {}
window.Highcharts.createKnowledgeGraph = (options={}) ->
  renderTo = options['renderTo'] || throw "key renderTo is required, expected to match an element's attr id"
  knowledges = options['knowledges'] || throw "key knowledges is required, expected to be a list of knowledges names"
  hovers = options['hovers'] || throw "key hovers is required, expected to be a list of hovers names"
  values = options['values'] || throw "key knowledges is required, expected to be a list of knowledges integers in [0..10] range"
  levels = options['levels'] || ['Rookie', 'Good', 'Quite Good']
  levels.unshift("")


  completeOptions =
    credits:
      enabled: false
    chart:
      renderTo: renderTo
      type: 'column'
      height: 330
    title:
      text: false
    legend:
      enabled: false
    xAxis:
      title:
        text: null
      categories: knowledges
      gridLineColor: 'transparent'
    yAxis:
      title:
        text: null
      labels:
        formatter: ->
          @value = parseFloat(@value.toFixed(2))
          previous = 0
          for level in levels
            if @value >= previous && @value < (10/levels.length + previous)
              return level
            previous += parseFloat((10/levels.length).toFixed(2))
      min: 0
      max: 10
      tickInterval: (10/levels.length)
      lineColor: '#979797'
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
