@AbapCatalog.sqlViewName: 'Z27CBOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@VDM.viewType: #CONSUMPTION
@EndUserText.label: 'Train-27'
@OData.publish: true

@Metadata.allowExtensions: true
@ObjectModel: {
    semanticKey: ['AirlineID', 'ConnectionNumber', 'FlightDate', 'BookingNumber'],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view Z27_C_BOOKINGTP as select from DS4_I_BOOKINGTP
association [1] to Z27_C_CUSTOMERTP as _Customer
    on $projection.CustomerGuid = _Customer.CustomerGuid {
    
    key BookingGuid,
    AirlineID,
    ConnectionNumber,
    FlightDate,
    BookingNumber,
    BookingDate,
    Class,
    ForeignCurrencyPayment,
    ForeignCurrency,
    AgencyNumber,
    CustomerGuid,
    IsCancelled,
    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _Customer // Make association public
}
