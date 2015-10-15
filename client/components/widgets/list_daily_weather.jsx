var React = require('react')
var Reqwest = require('reqwest')
var TimeHelper = require('../../helpers/time_helper.js')
var d3 = require('d3')

module.exports = React.createClass({
  getInitialState: function(){
    return ({
      data: '',
      graph: ''
    })
  },

  componentDidMount: function(){
    if (this.isMounted()) {
      console.log('this list is mounted')
      this.getDailyWeather()
    }
  },

  setData: function(resp) {
    this.setState({
      data: resp
    })
  },

  getDailyWeather: function() {
    console.log('making new request')
    Reqwest({
      url: 'http://localhost:5000/weathers/daily/4',
      method: 'GET',
      contentType: 'application/json',
      success: function(resp) { this.setData(resp) }.bind(this),
      error: function(){
        throw new Error('The request to ' + this.url + 'failed')
      },
      complete: function() {
        return
      }
    })
  },

  getDailyList: function () {
    var daily = this.state.data
    if ( daily.length > 0 ) {

     var data = daily.map( function(el, index) {
        return this.serialize(el.id, el.daily)
      }.bind(this))

     return this.renderDailyList(data)
    }
  },

  serialize: function(id, object) {
    var dataArray = []
    var graph = []
 
    var data = JSON.parse(object).data[0]
    console.log(data)
    var time = TimeHelper.humanTime(data.time)

    for(var key in data) {
      if(typeof(data[key]) === 'number' && data[key] < 500) {
        graph.push(data[key])
      }

      dataArray.push(<li key={key + id}>{key + ': ' + data[key]}</li>)
    }

    return { id: id, data: dataArray, graph: graph }
  },

  renderDailyList: function(data) {
    var data = data[0].graph
    console.log(data)

    var width = 960
        height = 500

    var y = d3.scale.linear()
        .range([height, 0])

    var chart = d3.select('.chart')
        .attr('width', width)
        .attr('height', height)

    y.domain([0, d3.max(data)]) 

    var barWidth = width / data.length

    var bar = chart.selectAll('g')
        .data(data)
      .enter().append('g')
        .attr('transform', function(d, i) { return "translate(" + i * barWidth + ",0)"; });

    bar.append("rect")
       .attr("y", function(d) { return y(d) })
       .attr("height", function(d) { return height - y(d) })
       .attr("width", barWidth - 1)

    bar.append("text")
       .attr("x", barWidth / 2)
       .attr("y", function(d) { return y(d) + 3 })
       .attr("dy", ".75em")
       .text(function(d) { return d; });


    var uniform = data.map( function(el) {
      return (
        <div className='col-lg-4'>
          <div className='widget weather'>
            <ul key={el.id}>{el.data}</ul>
          </div>
        </div>
      )
    })
    return uniform
  },

 render: function(){
   this.getDailyList()
   return (
     <div>
       <div className='row'>
         <div className='col-lg-12'>
           <svg className='chart' />
         </div>
       </div>
     </div>
   )
 }
})
