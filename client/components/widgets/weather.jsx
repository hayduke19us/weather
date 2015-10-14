var Config = require('../../config/config.js')

var React = require('react')
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome')
var reqwest = require('reqwest')
var WebSocket = require('ws')
var Ws = new WebSocket('ws://localhost:5000')
Ws.onmessage = function(msg) {
 console.log(msg) 
}

var WeatherIcon = require('../actions/weather_icon.jsx')

function humanTime(time) {
  var date = new Date(time*1000)
      dateStr = date.toDateString()
      hour    = date.getHours()
      minutes = date.getMinutes()
      return dateStr + ' ' + hour + ':' + minutes
}

module.exports = React.createClass({
  getInitialState: function() {
    return {
      temp: '',
      summary: '',
      time: '',
      ozone: '',
      icon: ''
    };
  },

  componentDidMount: function() {
    if (this.isMounted()) {
      this.getWeather(this)
      this.getWeatherState()
    }
    console.log(Config.REDIS_URL)
    console.log(Config.WS)
  },

  getWeatherState: function(){
  },

  getWeather: function(self) {
    reqwest({
      url: 'http://localhost:5000/weathers/current',
      method: 'GET',
      contentType: 'application/json',
      success: function (resp) {
        var current = JSON.parse(resp.current)
        var time = new Date(current.time*1000)
        self.setState({
          temp: current.temperature,
          summary: current.summary,
          time: humanTime(current.time),
          ozone: current.ozone,
          icon: current.icon
        })
      }
    })
  },

  render: function() {
    return (
      <div>
        <Link href='/weather'>
          <div className='widget weather'>
            <WeatherIcon icon={this.state.icon} />
            <h1 className='inline white'>{ this.state.temp } </h1> 
            <span className='climacon farenheit large-icon' />
            <h4 className=''>{ this.state.summary } </h4> 
            <h4 className=''>Ozone: { this.state.ozone } </h4> 
            <h4 className=''>Time: { this.state.time } </h4> 
          </div>
        </Link>
      </div>
    );
  }
})
