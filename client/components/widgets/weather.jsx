var Config = require('../../config/config.js')

var React = require('react')
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome')
var reqwest = require('reqwest')
var WebSocket = require('ws')
var TimeHelper = require('../../helpers/time_helper.js')

var Ws = new WebSocket('ws://localhost:5000')
Ws.onmessage = function(msg) {
 console.log(msg) 
}

var WeatherIcon = require('../actions/weather_icon.jsx')

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
    }
  },

  getWeather: function(self) {
    reqwest({
      url: 'http://localhost:5000/weathers/current',
      method: 'GET',
      contentType: 'application/json',
      success: function (resp) {
        var current = JSON.parse(resp.current)
        self.setState({
          temp: current.temperature,
          summary: current.summary,
          time: TimeHelper.humanTime(current.time),
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
            <h5 className='white'>Weather</h5>
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
