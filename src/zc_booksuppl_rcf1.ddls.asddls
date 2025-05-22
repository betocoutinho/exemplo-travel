@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplier'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUPPL_RCF1
  as projection on ZI_booksuppl_rcf1
{
      @ObjectModel.text.element: [ 'Description' ]
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'suppltext' ]
      @Consumption.valueHelpDefinition: [{ entity: {
          name: '/DMO/I_Supplement',
          element: 'SupplementID'
      } }]
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      _travel.Description    as Description,
      _supplText.Description as suppltext,
      /* Associations */
      _booking : redirected to parent ZC_BOOKING_RCF1,
      _suppl,
      _supplText,
      _travel  : redirected to ZC_TRAVEL_RCF1
}
