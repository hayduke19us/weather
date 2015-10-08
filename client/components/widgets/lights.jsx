var React = require('react');
var FontA_ = require('react-fontawesome');

module.exports = React.createClass({
  render: function(lights) {
    return (
      <a href='#'>
        <div className='widget lg lights'>
          <h1>Lights</h1>
          <div className='center'>
            <FontA_ className='large-icon' name='lightbulb-o'
            style={{ color: 'white' }} />
          </div>
        </div>
      </a>
    );
  }
})
