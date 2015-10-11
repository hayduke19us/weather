var React = require('react');

var Weather = require('../widgets/weather.jsx')
var Thermostat = require('../widgets/thermostat.jsx')
var Garden = require('../widgets/garden.jsx')
var Lights = require('../widgets/lights.jsx')
var Internet = require('../widgets/internet.jsx')

module.exports = React.createClass({
  render: function () {
    return (
      <div id='components'>
        <Weather />
        <Thermostat />
        <Garden />
        <Internet />
        <Lights />
      </div>
    );
  }
});
