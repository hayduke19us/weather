var __path__ = '../../client/components/widgets/garden.jsx'
jest.dontMock(__path__)

var React = require('react'),
    ReactDom = require('react-dom'),
    TestUtils = require('react-addons-test-utils')

var Garden = require(__path__),
    garden_widget = TestUtils.renderIntoDocument(<Garden/>),
    widget = TestUtils.findRenderedDOMComponentWithClass(garden_widget, 'widget garden')

describe('Weather', function(){
  it('has a class of widget garden', function() {
    expect(ReactDom.findDOMNode(widget).className).toEqual('widget garden')
  })
})
