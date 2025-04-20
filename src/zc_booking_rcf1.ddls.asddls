@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKING_RCF1 as projection on ZI_BOOKING_RCF1
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _bookingStatus,
    _bookSuppl : redirected to composition child ZC_BOOKSUPPL_RCF1,
    _carrier,
    _connection,
    _customer,
    _travel : redirected to parent ZC_TRAVEL_RCF1
}
