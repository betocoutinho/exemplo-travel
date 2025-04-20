@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplier'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKSUPPL_RCF1 as projection on ZI_booksuppl_rcf1
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking : redirected to parent ZC_BOOKING_RCF1,
    _suppl,
    _supplText,
    _travel
}
