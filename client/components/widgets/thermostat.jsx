var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function () {
    return (
      <a href='#'>
        <div className='widget thermostat'>
          <h1>Thermostat</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='circle-o-notch'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
