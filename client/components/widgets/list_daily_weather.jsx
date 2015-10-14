var React = require('react')
var Reqwest = require('reqwest')

module.exports = React.createClass({
  getInitialState: function(){
    return ({
      data: ''
    })
  },

  componentDidMount: function(){
    this.getDailyWeather(this)
  },

  setData: function(resp) {
    this.setState({
      data: resp
    })
  },

  getDailyWeather: function(self) {
    Reqwest({
      url: 'http://localhost:5000/weathers/daily/2',
      method: 'GET',
      contentType: 'application/json',
      success: function(resp) { self.setData(resp) }
    })
  },

  getDailyList: function (daily, self){
    console.log(daily.length)

    if ( daily.length > 0 ) {

      var map = new Map()

      daily.forEach( function(el, index) {
        map.set(index, self.serialize(el.id, el.daily))
      })
      
      return map

    }
  },

  serialize: function(id, object) {
    var dataArray = []
    var data = JSON.parse(object).data[0]

    for(var key in data) {
      dataArray.push(<li key={key}>{key + ': ' + data[key]}</li>)
    }
    return dataArray
  },

 render: function(){
     return (
       <ul>{this.getDailyList(this.state.data, this)}</ul>
     )
 }
})
