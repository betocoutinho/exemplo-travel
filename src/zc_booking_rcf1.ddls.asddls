@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_RCF1
  as projection on ZI_BOOKING_RCF1
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'Custname' ]
      @Consumption.valueHelpDefinition: [{ entity: {
      name: '/DMO/I_Customer',
      element: 'CustomerID' } }]
      CustomerId,
      _customer.FirstName                  as Custname,
      @ObjectModel.text.element: [ 'CarrierName' ]
      @Consumption.valueHelpDefinition: [{ entity: {
      name: '/DMO/I_Carrier',
      element: 'AirlineID' } }]
      CarrierId,
      _carrier.Name                        as CarrierName,
      @Consumption.valueHelpDefinition: [{ entity: {
          name: '/DMO/I_Connection',
          element: 'ConnectionID'
      },
          additionalBinding: [{
              localElement: 'CarrierId',
              element: 'AirlineID'
          }]
       }]
      ConnectionId,
      @ObjectModel.text.element: [ 'DepartureCity' ]
      _connection.DepartureAirport         as DepartureAirport,
      _connection._DepartureAirport.City   as DepartureCity,
      @ObjectModel.text.element: [ 'DestinationCity' ]
      _connection.DestinationAirport       as DestinationAirport,
      _connection._DestinationAirport.City as DestinationCity,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: {
          name: '/DMO/I_Booking_Status_VH',
          element: 'BookingStatus'
      } }]
      BookingStatus,
      _bookingStatus._Text.Text            as StatusText : localized,
      LastChangedAt,
      /* Associations */
      _bookingStatus,
      _bookSuppl : redirected to composition child ZC_BOOKSUPPL_RCF1,
      _carrier,
      _connection,
      _customer,
      _travel    : redirected to parent ZC_TRAVEL_RCF1
}
