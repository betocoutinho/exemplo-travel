@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKING_RCF1
  as select from /dmo/booking_m
  composition [0..*] of ZI_booksuppl_rcf1 as _bookSuppl
  association to parent ZI_TRAVEL_RCF1    as _travel        on $projection.TravelId = _travel.TravelId
  association to /DMO/I_Customer          as _customer      on $projection.CustomerId = _customer.CustomerID
  association to /DMO/I_Carrier           as _carrier       on $projection.CarrierId = _carrier.AirlineID
  association to /DMO/I_Connection        as _connection    on $projection.ConnectionId = _connection.ConnectionID
  association to /DMO/I_Booking_Status_VH as _bookingStatus on $projection.BookingStatus = _bookingStatus.BookingStatus

{
  key /dmo/booking_m.travel_id       as TravelId,
  key /dmo/booking_m.booking_id      as BookingId,
      /dmo/booking_m.booking_date    as BookingDate,
      /dmo/booking_m.customer_id     as CustomerId,
      /dmo/booking_m.carrier_id      as CarrierId,
      /dmo/booking_m.connection_id   as ConnectionId,
      /dmo/booking_m.flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      /dmo/booking_m.flight_price    as FlightPrice,
      /dmo/booking_m.currency_code   as CurrencyCode,
      /dmo/booking_m.booking_status  as BookingStatus,
      /dmo/booking_m.last_changed_at as LastChangedAt,
      _bookSuppl,
      _travel,
      _customer,
      _carrier,
      _connection,
      _bookingStatus

}
