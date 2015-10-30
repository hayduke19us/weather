var React = require('react')

var Icons = require('../layout/icons.jsx')

module.exports = React.createClass({

  render: function(){
    var woodUrl = './wood-back-lg.jpg'
    var paperUrl = './paperball-stack.png'

    var woodStyle = {
      backgroundImage: 'url(' + woodUrl +')'
    }

    var paperBalls = {
      backgroundImage: 'url(' + paperUrl + ')',
      height: '300px',
    }

    return  (
      <div className='vextend' style={woodStyle}>
        <div className='container-fluid'>
          <div className='row'>
            <div className='col-lg-8 white'>
              <div className='center vcenter'>
                <image src='./notepaper.png' alt='No Image'/>
              </div>
            </div>
            <div className='col-lg-4'>
              <div className='widget white vcenter'>
                <h1>Login</h1>
                <h2>Email</h2>
                <input className='form-control' type='text' name='email' />
                <h2>Password</h2>
                <input className='form-control' type='text' name='email' />
              </div>
            </div>
          </div>
        </div>
        <div id='footer'>
          <div className='container-fluid'>
            <div style={paperBalls}></div>
          </div>
        </div>
      </div>
    )
  }

})
