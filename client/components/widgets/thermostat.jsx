var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  getInitialState: function () {
    return {
      temp: 70
    }
  },

  render: function () {
    return (
      <a href='#'>
        <div className='widget thermostat'>
          <p><span className='climacon thermometer empty large-icon' /></p>
          <h5 className='white'>Thermostat</h5>
          <h1 className='inline white'>{ this.state.temp } </h1> 
          <span className='climacon farenheit large-icon' />
          <h4>High:</h4>
          <h4>Low:</h4>
        </div>
      </a>
    );
  }
})
