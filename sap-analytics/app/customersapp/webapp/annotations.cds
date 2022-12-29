using CustomersService as service from '../../../srv/customers-service';

annotate service.Customers with @(
        UI : {
            HeaderInfo  : {
                $Type : 'UI.HeaderInfoType',
                TypeName : '{i18n>customers}',
                TypeNamePlural : '{i18n>customers}',
                Title:{ Value : industry }
            },

            LineItem  : [
                {
                    Value : name,
                    ![@UI.Importance] : #High
                },
            ],
        }
);