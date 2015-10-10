var React = require('react');
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome');
var reqwest = require('reqwest')

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

  handleClick: function() {
    var x = ReactDom.findDOMNode(this)
    x.style.background='black'
  },

  getWeather: function(self) {
    reqwest({
      url: 'http://localhost:5000/weathers/current',
      method: 'GET',
      contentType: 'application/json',
      success: function (resp) {
        console.log(resp)
        var current = JSON.parse(resp.current)
        self.setState({
          temp: current.temperature,
          summary: current.summary,
          time: current.time,
          ozone: current.ozone,
          icon: current.icon
        })
      }
    })
  },

  render: function() {
    return (
      <div>
        <div className='widget weather'>
          <Link href='/weather_large'><h1>Weather</h1></Link>
          <div className='center'>
            <FontA_ className='large-icon' name='cloud'
            style={{ color: 'white' }} />
            <h2>{this.state.temp} F</h2>
            <h2>{this.state.summary} </h2>
          </div>
        </div>
        {this.props.children}
      </div>
    );
  }
})
