var React = require('react')
var Reqwest = require('reqwest')

module.exports = React.createClass({
  getInitialState: function(){
    return ({
      data: ''
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

     var data =  daily.map( function(el, index) {
        return this.serialize(el.id, el.daily)
      }.bind(this))

     console.log(data)
     return this.renderDailyList(data)
    }
  },

  serialize: function(id, object) {
    var dataArray = []
    var data = JSON.parse(object).data[0]

    for(var key in data) {
      dataArray.push(<li key={key}>{key + ': ' + data[key]}</li>)
    }
    return { id: id, data: dataArray }
  },

  renderDailyList: function(dataArray) {
    var uniform = dataArray.map( function(el) {
      return <div><h2>{el.id}</h2><ul key={el.id}>{el.data}</ul></div>
    })
    return uniform
  },

 render: function(){
   return (
     <div>{this.getDailyList()}</div>
   )
 }
})
