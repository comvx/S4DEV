@AbapCatalog.sqlViewName: 'Z27CCUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Train-27'
@VDM.viewType: #CONSUMPTION
@OData.publish: true

@UI: {
    headerInfo: {
    typeName: 'Flight Customer',
    typeNamePlural: 'Flight Customers',
    title: {
        value: 'CustomerName'
    },
    description: {
        value: 'CustomerName'
    }
}
}
@Search.searchable: true
@Metadata.allowExtensions: true
@ObjectModel: {
    transactionalProcessingDelegated: true,
    compositionRoot: true,
    semanticKey: ['CustomerNumber'],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view Z27_C_CUSTOMERTP as select from DS4_I_CUSTOMERTP
                                association[*] to Z27_C_BOOKINGTP as _Booking on
                                $projection.CustomerGuid = _Booking.CustomerGuid {
    key CustomerGuid,
    CustomerNumber,
    Form,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    CustomerName,
    Street,
    PostCode,
    City,
    Country,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    Email,
    Telephone,
    Discount,
    @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _Booking
}
