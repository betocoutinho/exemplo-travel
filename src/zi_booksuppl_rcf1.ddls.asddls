@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_booksuppl_rcf1
  as select from /dmo/booksuppl_m
  association to parent ZI_BOOKING_RCF1 as _booking   on  $projection.TravelId  = _booking.TravelId
                                                      and $projection.BookingId = _booking.BookingId
  association to ZI_TRAVEL_RCF1         as _travel    on  $projection.TravelId = _travel.TravelId
  association to /DMO/I_Supplement      as _suppl     on  $projection.BookingSupplementId = _suppl.SupplementID
  association to /DMO/I_SupplementText  as _supplText on  $projection.SupplementId = _supplText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      last_changed_at       as LastChangedAt,
      _booking,
      _travel,
      _suppl,
      _supplText
}
