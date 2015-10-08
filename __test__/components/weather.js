var __path__ = '../../client/components/widgets/weather.jsx'
jest.dontMock(__path__)

var React = require('react'),
    ReactDom = require('react-dom'),
    TestUtils = require('react-addons-test-utils')

var Weather = require(__path__),
    weather_widget = TestUtils.renderIntoDocument(<Weather/>),
    widget = TestUtils.findRenderedDOMComponentWithClass(weather_widget, 
                                                       'widget weather')

describe('Weather', function(){
  it('has a class of widget weather', function() {
    expect(ReactDom.findDOMNode(widget).className).toEqual('widget weather')
  });
});
