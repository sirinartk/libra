

// ** structs of module U64Util



// ** functions of module U64Util

procedure {:inline 1} U64Util_u64_to_bytes (i: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);



// ** structs of module AddressUtil



// ** functions of module AddressUtil

procedure {:inline 1} AddressUtil_address_to_bytes (addr: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);



// ** structs of module BytearrayUtil



// ** functions of module BytearrayUtil

procedure {:inline 1} BytearrayUtil_bytearray_concat (data1: Value, data2: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);



// ** structs of module Hash



// ** functions of module Hash

procedure {:inline 1} Hash_sha2_256 (data: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);

procedure {:inline 1} Hash_sha3_256 (data: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);



// ** structs of module Signature



// ** functions of module Signature

procedure {:inline 1} Signature_ed25519_verify (signature: Value, public_key: Value, message: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);

procedure {:inline 1} Signature_ed25519_threshold_verify (bitmap: Value, signature: Value, public_key: Value, message: Value) returns (__ret0: Value);
requires ExistsTxnSenderAccount(__m, __txn);



// ** structs of module GasSchedule

const unique GasSchedule_Cost: TypeName;
const GasSchedule_Cost_cpu: FieldName;
axiom GasSchedule_Cost_cpu == 0;
const GasSchedule_Cost_storage: FieldName;
axiom GasSchedule_Cost_storage == 1;
function GasSchedule_Cost_type_value(): TypeValue {
    StructType(GasSchedule_Cost, ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()), IntegerType()))
}
procedure {:inline 1} Pack_GasSchedule_Cost(cpu: Value, storage: Value) returns (_struct: Value)
{
    assume IsValidU64(cpu);
    assume IsValidU64(storage);
    _struct := Vector(ExtendValueArray(ExtendValueArray(EmptyValueArray, cpu), storage));
}

procedure {:inline 1} Unpack_GasSchedule_Cost(_struct: Value) returns (cpu: Value, storage: Value)
{
    assume is#Vector(_struct);
    cpu := SelectField(_struct, GasSchedule_Cost_cpu);
    assume IsValidU64(cpu);
    storage := SelectField(_struct, GasSchedule_Cost_storage);
    assume IsValidU64(storage);
}

const unique GasSchedule_T: TypeName;
const GasSchedule_T_instruction_schedule: FieldName;
axiom GasSchedule_T_instruction_schedule == 0;
const GasSchedule_T_native_schedule: FieldName;
axiom GasSchedule_T_native_schedule == 1;
function GasSchedule_T_type_value(): TypeValue {
    StructType(GasSchedule_T, ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, Vector_T_type_value(GasSchedule_Cost_type_value())), Vector_T_type_value(GasSchedule_Cost_type_value())))
}
procedure {:inline 1} Pack_GasSchedule_T(instruction_schedule: Value, native_schedule: Value) returns (_struct: Value)
{
    assume is#Vector(instruction_schedule);
    assume is#Vector(native_schedule);
    _struct := Vector(ExtendValueArray(ExtendValueArray(EmptyValueArray, instruction_schedule), native_schedule));
}

procedure {:inline 1} Unpack_GasSchedule_T(_struct: Value) returns (instruction_schedule: Value, native_schedule: Value)
{
    assume is#Vector(_struct);
    instruction_schedule := SelectField(_struct, GasSchedule_T_instruction_schedule);
    assume is#Vector(instruction_schedule);
    native_schedule := SelectField(_struct, GasSchedule_T_native_schedule);
    assume is#Vector(native_schedule);
}



// ** functions of module GasSchedule

procedure {:inline 1} GasSchedule_initialize (gas_schedule: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Value; // AddressType()
    var __t3: Value; // BooleanType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // GasSchedule_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#GasSchedule#initialize#0#gas_schedule: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 7;
    debug#GasSchedule#initialize#0#gas_schedule := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(gas_schedule);
    __m := UpdateLocal(__m, __frame + 0, gas_schedule);
    debug#GasSchedule#initialize#0#gas_schedule := debug#GasSchedule#initialize#0#gas_schedule[Position(1239) := gas_schedule];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 1), GetLocal(__m, __frame + 2)));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __tmp := GetLocal(__m, __frame + 4);
    if (!b#Boolean(__tmp)) { goto Label_7; }

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    goto Label_Abort;

Label_7:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call MoveToSender(GasSchedule_T_type_value(), GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure GasSchedule_initialize_verify (gas_schedule: Value) returns ()
{
    call InitVerification();
    call GasSchedule_initialize(gas_schedule);
}

procedure {:inline 1} GasSchedule_instruction_table_size () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var table: Reference; // ReferenceType(GasSchedule_T_type_value())
    var instruction_table_len: Value; // IntegerType()
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(GasSchedule_T_type_value())
    var __t4: Reference; // ReferenceType(GasSchedule_T_type_value())
    var __t5: Reference; // ReferenceType(Vector_T_type_value(GasSchedule_Cost_type_value()))
    var __t6: Value; // IntegerType()
    var __t7: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#GasSchedule#instruction_table_size#0#table: [Position]Value;
    var debug#GasSchedule#instruction_table_size#1#instruction_table_len: [Position]Value;
    var debug#GasSchedule#instruction_table_size#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#GasSchedule#instruction_table_size#0#table := EmptyPositionMap;
    debug#GasSchedule#instruction_table_size#1#instruction_table_len := EmptyPositionMap;
    debug#GasSchedule#instruction_table_size#2#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), GasSchedule_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call table := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(table);

    call __t5 := BorrowField(__t4, GasSchedule_T_instruction_schedule);

    call __t6 := Vector_length(GasSchedule_Cost_type_value(), __t5);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t6);

    __m := UpdateLocal(__m, __frame + 6, __t6);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#GasSchedule#instruction_table_size#1#instruction_table_len := debug#GasSchedule#instruction_table_size#1#instruction_table_len[Position(1569) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __ret0 := GetLocal(__m, __frame + 7);
    debug#GasSchedule#instruction_table_size#2#__ret := debug#GasSchedule#instruction_table_size#2#__ret[Position(1662) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#GasSchedule#instruction_table_size#2#__ret := debug#GasSchedule#instruction_table_size#2#__ret[Position(1702) := __ret0];
}

procedure GasSchedule_instruction_table_size_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := GasSchedule_instruction_table_size();
}

procedure {:inline 1} GasSchedule_native_table_size () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var table: Reference; // ReferenceType(GasSchedule_T_type_value())
    var native_table_len: Value; // IntegerType()
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(GasSchedule_T_type_value())
    var __t4: Reference; // ReferenceType(GasSchedule_T_type_value())
    var __t5: Reference; // ReferenceType(Vector_T_type_value(GasSchedule_Cost_type_value()))
    var __t6: Value; // IntegerType()
    var __t7: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#GasSchedule#native_table_size#0#table: [Position]Value;
    var debug#GasSchedule#native_table_size#1#native_table_len: [Position]Value;
    var debug#GasSchedule#native_table_size#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#GasSchedule#native_table_size#0#table := EmptyPositionMap;
    debug#GasSchedule#native_table_size#1#native_table_len := EmptyPositionMap;
    debug#GasSchedule#native_table_size#2#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), GasSchedule_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call table := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(table);

    call __t5 := BorrowField(__t4, GasSchedule_T_native_schedule);

    call __t6 := Vector_length(GasSchedule_Cost_type_value(), __t5);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t6);

    __m := UpdateLocal(__m, __frame + 6, __t6);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#GasSchedule#native_table_size#1#native_table_len := debug#GasSchedule#native_table_size#1#native_table_len[Position(1870) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __ret0 := GetLocal(__m, __frame + 7);
    debug#GasSchedule#native_table_size#2#__ret := debug#GasSchedule#native_table_size#2#__ret[Position(1953) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#GasSchedule#native_table_size#2#__ret := debug#GasSchedule#native_table_size#2#__ret[Position(1988) := __ret0];
}

procedure GasSchedule_native_table_size_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := GasSchedule_native_table_size();
}



// ** structs of module ValidatorConfig

const unique ValidatorConfig_Config: TypeName;
const ValidatorConfig_Config_consensus_pubkey: FieldName;
axiom ValidatorConfig_Config_consensus_pubkey == 0;
const ValidatorConfig_Config_validator_network_signing_pubkey: FieldName;
axiom ValidatorConfig_Config_validator_network_signing_pubkey == 1;
const ValidatorConfig_Config_validator_network_identity_pubkey: FieldName;
axiom ValidatorConfig_Config_validator_network_identity_pubkey == 2;
const ValidatorConfig_Config_validator_network_address: FieldName;
axiom ValidatorConfig_Config_validator_network_address == 3;
const ValidatorConfig_Config_fullnodes_network_identity_pubkey: FieldName;
axiom ValidatorConfig_Config_fullnodes_network_identity_pubkey == 4;
const ValidatorConfig_Config_fullnodes_network_address: FieldName;
axiom ValidatorConfig_Config_fullnodes_network_address == 5;
function ValidatorConfig_Config_type_value(): TypeValue {
    StructType(ValidatorConfig_Config, ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, ByteArrayType()), ByteArrayType()), ByteArrayType()), ByteArrayType()), ByteArrayType()), ByteArrayType()))
}
procedure {:inline 1} Pack_ValidatorConfig_Config(consensus_pubkey: Value, validator_network_signing_pubkey: Value, validator_network_identity_pubkey: Value, validator_network_address: Value, fullnodes_network_identity_pubkey: Value, fullnodes_network_address: Value) returns (_struct: Value)
{
    assume is#ByteArray(consensus_pubkey);
    assume is#ByteArray(validator_network_signing_pubkey);
    assume is#ByteArray(validator_network_identity_pubkey);
    assume is#ByteArray(validator_network_address);
    assume is#ByteArray(fullnodes_network_identity_pubkey);
    assume is#ByteArray(fullnodes_network_address);
    _struct := Vector(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(EmptyValueArray, consensus_pubkey), validator_network_signing_pubkey), validator_network_identity_pubkey), validator_network_address), fullnodes_network_identity_pubkey), fullnodes_network_address));
}

procedure {:inline 1} Unpack_ValidatorConfig_Config(_struct: Value) returns (consensus_pubkey: Value, validator_network_signing_pubkey: Value, validator_network_identity_pubkey: Value, validator_network_address: Value, fullnodes_network_identity_pubkey: Value, fullnodes_network_address: Value)
{
    assume is#Vector(_struct);
    consensus_pubkey := SelectField(_struct, ValidatorConfig_Config_consensus_pubkey);
    assume is#ByteArray(consensus_pubkey);
    validator_network_signing_pubkey := SelectField(_struct, ValidatorConfig_Config_validator_network_signing_pubkey);
    assume is#ByteArray(validator_network_signing_pubkey);
    validator_network_identity_pubkey := SelectField(_struct, ValidatorConfig_Config_validator_network_identity_pubkey);
    assume is#ByteArray(validator_network_identity_pubkey);
    validator_network_address := SelectField(_struct, ValidatorConfig_Config_validator_network_address);
    assume is#ByteArray(validator_network_address);
    fullnodes_network_identity_pubkey := SelectField(_struct, ValidatorConfig_Config_fullnodes_network_identity_pubkey);
    assume is#ByteArray(fullnodes_network_identity_pubkey);
    fullnodes_network_address := SelectField(_struct, ValidatorConfig_Config_fullnodes_network_address);
    assume is#ByteArray(fullnodes_network_address);
}

const unique ValidatorConfig_T: TypeName;
const ValidatorConfig_T_config: FieldName;
axiom ValidatorConfig_T_config == 0;
function ValidatorConfig_T_type_value(): TypeValue {
    StructType(ValidatorConfig_T, ExtendTypeValueArray(EmptyTypeValueArray, ValidatorConfig_Config_type_value()))
}
procedure {:inline 1} Pack_ValidatorConfig_T(config: Value) returns (_struct: Value)
{
    assume is#Vector(config);
    _struct := Vector(ExtendValueArray(EmptyValueArray, config));
}

procedure {:inline 1} Unpack_ValidatorConfig_T(_struct: Value) returns (config: Value)
{
    assume is#Vector(_struct);
    config := SelectField(_struct, ValidatorConfig_T_config);
    assume is#Vector(config);
}



// ** functions of module ValidatorConfig

procedure {:inline 1} ValidatorConfig_has (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Value; // BooleanType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#has#0#addr: [Position]Value;
    var debug#ValidatorConfig#has#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 3;
    debug#ValidatorConfig#has#0#addr := EmptyPositionMap;
    debug#ValidatorConfig#has#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#ValidatorConfig#has#0#addr := debug#ValidatorConfig#has#0#addr[Position(645) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 1), ValidatorConfig_T_type_value());
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    __ret0 := GetLocal(__m, __frame + 2);
    debug#ValidatorConfig#has#1#__ret := debug#ValidatorConfig#has#1#__ret[Position(687) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#has#1#__ret := debug#ValidatorConfig#has#1#__ret[Position(721) := __ret0];
}

procedure ValidatorConfig_has_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_has(addr);
}

procedure {:inline 1} ValidatorConfig_config (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var t_ref: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t4: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t5: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t6: Value; // ValidatorConfig_Config_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#config#0#addr: [Position]Value;
    var debug#ValidatorConfig#config#1#t_ref: [Position]Value;
    var debug#ValidatorConfig#config#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 7;
    debug#ValidatorConfig#config#0#addr := EmptyPositionMap;
    debug#ValidatorConfig#config#1#t_ref := EmptyPositionMap;
    debug#ValidatorConfig#config#2#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#ValidatorConfig#config#0#addr := debug#ValidatorConfig#config#0#addr[Position(907) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), ValidatorConfig_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call t_ref := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(t_ref);

    call __t5 := BorrowField(__t4, ValidatorConfig_T_config);

    call __tmp := ReadRef(__t5);
    assume is#Vector(__tmp);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __ret0 := GetLocal(__m, __frame + 6);
    debug#ValidatorConfig#config#2#__ret := debug#ValidatorConfig#config#2#__ret[Position(1045) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#config#2#__ret := debug#ValidatorConfig#config#2#__ret[Position(1078) := __ret0];
}

procedure ValidatorConfig_config_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_config(addr);
}

procedure {:inline 1} ValidatorConfig_consensus_pubkey (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#consensus_pubkey#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#consensus_pubkey#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#consensus_pubkey#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#consensus_pubkey#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#consensus_pubkey#0#config_ref := debug#ValidatorConfig#consensus_pubkey#0#config_ref[Position(1129) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_consensus_pubkey);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#consensus_pubkey#1#__ret := debug#ValidatorConfig#consensus_pubkey#1#__ret[Position(1200) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#consensus_pubkey#1#__ret := debug#ValidatorConfig#consensus_pubkey#1#__ret[Position(1248) := __ret0];
}

procedure ValidatorConfig_consensus_pubkey_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_consensus_pubkey(config_ref);
}

procedure {:inline 1} ValidatorConfig_validator_network_signing_pubkey (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#validator_network_signing_pubkey#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#validator_network_signing_pubkey#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#validator_network_signing_pubkey#0#config_ref := debug#ValidatorConfig#validator_network_signing_pubkey#0#config_ref[Position(1315) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_validator_network_signing_pubkey);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret := debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret[Position(1402) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret := debug#ValidatorConfig#validator_network_signing_pubkey#1#__ret[Position(1466) := __ret0];
}

procedure ValidatorConfig_validator_network_signing_pubkey_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_validator_network_signing_pubkey(config_ref);
}

procedure {:inline 1} ValidatorConfig_validator_network_identity_pubkey (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#validator_network_identity_pubkey#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#validator_network_identity_pubkey#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#validator_network_identity_pubkey#0#config_ref := debug#ValidatorConfig#validator_network_identity_pubkey#0#config_ref[Position(1534) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_validator_network_identity_pubkey);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret := debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret[Position(1622) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret := debug#ValidatorConfig#validator_network_identity_pubkey#1#__ret[Position(1687) := __ret0];
}

procedure ValidatorConfig_validator_network_identity_pubkey_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_validator_network_identity_pubkey(config_ref);
}

procedure {:inline 1} ValidatorConfig_validator_network_address (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#validator_network_address#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#validator_network_address#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#validator_network_address#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#validator_network_address#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#validator_network_address#0#config_ref := debug#ValidatorConfig#validator_network_address#0#config_ref[Position(1747) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_validator_network_address);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#validator_network_address#1#__ret := debug#ValidatorConfig#validator_network_address#1#__ret[Position(1827) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#validator_network_address#1#__ret := debug#ValidatorConfig#validator_network_address#1#__ret[Position(1884) := __ret0];
}

procedure ValidatorConfig_validator_network_address_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_validator_network_address(config_ref);
}

procedure {:inline 1} ValidatorConfig_fullnodes_network_identity_pubkey (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#fullnodes_network_identity_pubkey#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#fullnodes_network_identity_pubkey#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#fullnodes_network_identity_pubkey#0#config_ref := debug#ValidatorConfig#fullnodes_network_identity_pubkey#0#config_ref[Position(1952) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_fullnodes_network_identity_pubkey);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret := debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret[Position(2040) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret := debug#ValidatorConfig#fullnodes_network_identity_pubkey#1#__ret[Position(2105) := __ret0];
}

procedure ValidatorConfig_fullnodes_network_identity_pubkey_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_fullnodes_network_identity_pubkey(config_ref);
}

procedure {:inline 1} ValidatorConfig_fullnodes_network_address (config_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t2: Reference; // ReferenceType(ByteArrayType())
    var __t3: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#fullnodes_network_address#0#config_ref: [Position]Value;
    var debug#ValidatorConfig#fullnodes_network_address#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#ValidatorConfig#fullnodes_network_address#0#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#fullnodes_network_address#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, config_ref));
    assume IsValidReferenceParameter(__m, __frame, config_ref);
    debug#ValidatorConfig#fullnodes_network_address#0#config_ref := debug#ValidatorConfig#fullnodes_network_address#0#config_ref[Position(2165) := Dereference(__m, config_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(config_ref);

    call __t2 := BorrowField(__t1, ValidatorConfig_Config_fullnodes_network_address);

    call __tmp := ReadRef(__t2);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#ValidatorConfig#fullnodes_network_address#1#__ret := debug#ValidatorConfig#fullnodes_network_address#1#__ret[Position(2245) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#ValidatorConfig#fullnodes_network_address#1#__ret := debug#ValidatorConfig#fullnodes_network_address#1#__ret[Position(2302) := __ret0];
}

procedure ValidatorConfig_fullnodes_network_address_verify (config_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := ValidatorConfig_fullnodes_network_address(config_ref);
}

procedure {:inline 1} ValidatorConfig_register_candidate_validator (consensus_pubkey: Value, validator_network_signing_pubkey: Value, validator_network_identity_pubkey: Value, validator_network_address: Value, fullnodes_network_identity_pubkey: Value, fullnodes_network_address: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t6: Value; // ByteArrayType()
    var __t7: Value; // ByteArrayType()
    var __t8: Value; // ByteArrayType()
    var __t9: Value; // ByteArrayType()
    var __t10: Value; // ByteArrayType()
    var __t11: Value; // ByteArrayType()
    var __t12: Value; // ValidatorConfig_Config_type_value()
    var __t13: Value; // ValidatorConfig_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#register_candidate_validator#0#consensus_pubkey: [Position]Value;
    var debug#ValidatorConfig#register_candidate_validator#1#validator_network_signing_pubkey: [Position]Value;
    var debug#ValidatorConfig#register_candidate_validator#2#validator_network_identity_pubkey: [Position]Value;
    var debug#ValidatorConfig#register_candidate_validator#3#validator_network_address: [Position]Value;
    var debug#ValidatorConfig#register_candidate_validator#4#fullnodes_network_identity_pubkey: [Position]Value;
    var debug#ValidatorConfig#register_candidate_validator#5#fullnodes_network_address: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 14;
    debug#ValidatorConfig#register_candidate_validator#0#consensus_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#register_candidate_validator#1#validator_network_signing_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#register_candidate_validator#2#validator_network_identity_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#register_candidate_validator#3#validator_network_address := EmptyPositionMap;
    debug#ValidatorConfig#register_candidate_validator#4#fullnodes_network_identity_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#register_candidate_validator#5#fullnodes_network_address := EmptyPositionMap;

    // process and type check arguments
    assume is#ByteArray(consensus_pubkey);
    __m := UpdateLocal(__m, __frame + 0, consensus_pubkey);
    debug#ValidatorConfig#register_candidate_validator#0#consensus_pubkey := debug#ValidatorConfig#register_candidate_validator#0#consensus_pubkey[Position(2532) := consensus_pubkey];
    assume is#ByteArray(validator_network_signing_pubkey);
    __m := UpdateLocal(__m, __frame + 1, validator_network_signing_pubkey);
    debug#ValidatorConfig#register_candidate_validator#1#validator_network_signing_pubkey := debug#ValidatorConfig#register_candidate_validator#1#validator_network_signing_pubkey[Position(2532) := validator_network_signing_pubkey];
    assume is#ByteArray(validator_network_identity_pubkey);
    __m := UpdateLocal(__m, __frame + 2, validator_network_identity_pubkey);
    debug#ValidatorConfig#register_candidate_validator#2#validator_network_identity_pubkey := debug#ValidatorConfig#register_candidate_validator#2#validator_network_identity_pubkey[Position(2532) := validator_network_identity_pubkey];
    assume is#ByteArray(validator_network_address);
    __m := UpdateLocal(__m, __frame + 3, validator_network_address);
    debug#ValidatorConfig#register_candidate_validator#3#validator_network_address := debug#ValidatorConfig#register_candidate_validator#3#validator_network_address[Position(2532) := validator_network_address];
    assume is#ByteArray(fullnodes_network_identity_pubkey);
    __m := UpdateLocal(__m, __frame + 4, fullnodes_network_identity_pubkey);
    debug#ValidatorConfig#register_candidate_validator#4#fullnodes_network_identity_pubkey := debug#ValidatorConfig#register_candidate_validator#4#fullnodes_network_identity_pubkey[Position(2532) := fullnodes_network_identity_pubkey];
    assume is#ByteArray(fullnodes_network_address);
    __m := UpdateLocal(__m, __frame + 5, fullnodes_network_address);
    debug#ValidatorConfig#register_candidate_validator#5#fullnodes_network_address := debug#ValidatorConfig#register_candidate_validator#5#fullnodes_network_address[Position(2532) := fullnodes_network_address];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := Pack_ValidatorConfig_Config(GetLocal(__m, __frame + 6), GetLocal(__m, __frame + 7), GetLocal(__m, __frame + 8), GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 10), GetLocal(__m, __frame + 11));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call __tmp := Pack_ValidatorConfig_T(GetLocal(__m, __frame + 12));
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call MoveToSender(ValidatorConfig_T_type_value(), GetLocal(__m, __frame + 13));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure ValidatorConfig_register_candidate_validator_verify (consensus_pubkey: Value, validator_network_signing_pubkey: Value, validator_network_identity_pubkey: Value, validator_network_address: Value, fullnodes_network_identity_pubkey: Value, fullnodes_network_address: Value) returns ()
{
    call InitVerification();
    call ValidatorConfig_register_candidate_validator(consensus_pubkey, validator_network_signing_pubkey, validator_network_identity_pubkey, validator_network_address, fullnodes_network_identity_pubkey, fullnodes_network_address);
}

procedure {:inline 1} ValidatorConfig_rotate_consensus_pubkey (consensus_pubkey: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var t_ref: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var config_ref: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var key_ref: Reference; // ReferenceType(ByteArrayType())
    var __t4: Value; // AddressType()
    var __t5: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t6: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t7: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t8: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t9: Reference; // ReferenceType(ByteArrayType())
    var __t10: Value; // ByteArrayType()
    var __t11: Reference; // ReferenceType(ByteArrayType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#rotate_consensus_pubkey#0#consensus_pubkey: [Position]Value;
    var debug#ValidatorConfig#rotate_consensus_pubkey#1#t_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_consensus_pubkey#2#config_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_consensus_pubkey#3#key_ref: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 12;
    debug#ValidatorConfig#rotate_consensus_pubkey#0#consensus_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#rotate_consensus_pubkey#1#t_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_consensus_pubkey#2#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_consensus_pubkey#3#key_ref := EmptyPositionMap;

    // process and type check arguments
    assume is#ByteArray(consensus_pubkey);
    __m := UpdateLocal(__m, __frame + 0, consensus_pubkey);
    debug#ValidatorConfig#rotate_consensus_pubkey#0#consensus_pubkey := debug#ValidatorConfig#rotate_consensus_pubkey#0#consensus_pubkey[Position(3648) := consensus_pubkey];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := BorrowGlobal(GetLocal(__m, __frame + 4), ValidatorConfig_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call t_ref := CopyOrMoveRef(__t5);

    call __t6 := CopyOrMoveRef(t_ref);

    call __t7 := BorrowField(__t6, ValidatorConfig_T_config);

    call config_ref := CopyOrMoveRef(__t7);

    call __t8 := CopyOrMoveRef(config_ref);

    call __t9 := BorrowField(__t8, ValidatorConfig_Config_consensus_pubkey);

    call key_ref := CopyOrMoveRef(__t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __t11 := CopyOrMoveRef(key_ref);

    call WriteRef(__t11, GetLocal(__m, __frame + 10));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure ValidatorConfig_rotate_consensus_pubkey_verify (consensus_pubkey: Value) returns ()
{
    call InitVerification();
    call ValidatorConfig_rotate_consensus_pubkey(consensus_pubkey);
}

procedure {:inline 1} ValidatorConfig_rotate_validator_network_identity_pubkey (validator_network_identity_pubkey: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var t_ref: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var config_ref: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var key_ref: Reference; // ReferenceType(ByteArrayType())
    var __t4: Value; // AddressType()
    var __t5: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t6: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t7: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t8: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t9: Reference; // ReferenceType(ByteArrayType())
    var __t10: Value; // ByteArrayType()
    var __t11: Reference; // ReferenceType(ByteArrayType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#rotate_validator_network_identity_pubkey#0#validator_network_identity_pubkey: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_identity_pubkey#1#t_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_identity_pubkey#2#config_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_identity_pubkey#3#key_ref: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 12;
    debug#ValidatorConfig#rotate_validator_network_identity_pubkey#0#validator_network_identity_pubkey := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_identity_pubkey#1#t_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_identity_pubkey#2#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_identity_pubkey#3#key_ref := EmptyPositionMap;

    // process and type check arguments
    assume is#ByteArray(validator_network_identity_pubkey);
    __m := UpdateLocal(__m, __frame + 0, validator_network_identity_pubkey);
    debug#ValidatorConfig#rotate_validator_network_identity_pubkey#0#validator_network_identity_pubkey := debug#ValidatorConfig#rotate_validator_network_identity_pubkey#0#validator_network_identity_pubkey[Position(4265) := validator_network_identity_pubkey];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := BorrowGlobal(GetLocal(__m, __frame + 4), ValidatorConfig_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call t_ref := CopyOrMoveRef(__t5);

    call __t6 := CopyOrMoveRef(t_ref);

    call __t7 := BorrowField(__t6, ValidatorConfig_T_config);

    call config_ref := CopyOrMoveRef(__t7);

    call __t8 := CopyOrMoveRef(config_ref);

    call __t9 := BorrowField(__t8, ValidatorConfig_Config_validator_network_identity_pubkey);

    call key_ref := CopyOrMoveRef(__t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __t11 := CopyOrMoveRef(key_ref);

    call WriteRef(__t11, GetLocal(__m, __frame + 10));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure ValidatorConfig_rotate_validator_network_identity_pubkey_verify (validator_network_identity_pubkey: Value) returns ()
{
    call InitVerification();
    call ValidatorConfig_rotate_validator_network_identity_pubkey(validator_network_identity_pubkey);
}

procedure {:inline 1} ValidatorConfig_rotate_validator_network_address (validator_network_address: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var t_ref: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var config_ref: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var key_ref: Reference; // ReferenceType(ByteArrayType())
    var __t4: Value; // AddressType()
    var __t5: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t6: Reference; // ReferenceType(ValidatorConfig_T_type_value())
    var __t7: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t8: Reference; // ReferenceType(ValidatorConfig_Config_type_value())
    var __t9: Reference; // ReferenceType(ByteArrayType())
    var __t10: Value; // ByteArrayType()
    var __t11: Reference; // ReferenceType(ByteArrayType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#ValidatorConfig#rotate_validator_network_address#0#validator_network_address: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_address#1#t_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_address#2#config_ref: [Position]Value;
    var debug#ValidatorConfig#rotate_validator_network_address#3#key_ref: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 12;
    debug#ValidatorConfig#rotate_validator_network_address#0#validator_network_address := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_address#1#t_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_address#2#config_ref := EmptyPositionMap;
    debug#ValidatorConfig#rotate_validator_network_address#3#key_ref := EmptyPositionMap;

    // process and type check arguments
    assume is#ByteArray(validator_network_address);
    __m := UpdateLocal(__m, __frame + 0, validator_network_address);
    debug#ValidatorConfig#rotate_validator_network_address#0#validator_network_address := debug#ValidatorConfig#rotate_validator_network_address#0#validator_network_address[Position(4890) := validator_network_address];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := BorrowGlobal(GetLocal(__m, __frame + 4), ValidatorConfig_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call t_ref := CopyOrMoveRef(__t5);

    call __t6 := CopyOrMoveRef(t_ref);

    call __t7 := BorrowField(__t6, ValidatorConfig_T_config);

    call config_ref := CopyOrMoveRef(__t7);

    call __t8 := CopyOrMoveRef(config_ref);

    call __t9 := BorrowField(__t8, ValidatorConfig_Config_validator_network_address);

    call key_ref := CopyOrMoveRef(__t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __t11 := CopyOrMoveRef(key_ref);

    call WriteRef(__t11, GetLocal(__m, __frame + 10));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure ValidatorConfig_rotate_validator_network_address_verify (validator_network_address: Value) returns ()
{
    call InitVerification();
    call ValidatorConfig_rotate_validator_network_address(validator_network_address);
}



// ** structs of module LibraCoin

const unique LibraCoin_T: TypeName;
const LibraCoin_T_value: FieldName;
axiom LibraCoin_T_value == 0;
function LibraCoin_T_type_value(): TypeValue {
    StructType(LibraCoin_T, ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()))
}
procedure {:inline 1} Pack_LibraCoin_T(value: Value) returns (_struct: Value)
{
    assume IsValidU64(value);
    _struct := Vector(ExtendValueArray(EmptyValueArray, value));
}

procedure {:inline 1} Unpack_LibraCoin_T(_struct: Value) returns (value: Value)
{
    assume is#Vector(_struct);
    value := SelectField(_struct, LibraCoin_T_value);
    assume IsValidU64(value);
}

const unique LibraCoin_MintCapability: TypeName;
const LibraCoin_MintCapability__dummy: FieldName;
axiom LibraCoin_MintCapability__dummy == 0;
function LibraCoin_MintCapability_type_value(): TypeValue {
    StructType(LibraCoin_MintCapability, ExtendTypeValueArray(EmptyTypeValueArray, BooleanType()))
}
procedure {:inline 1} Pack_LibraCoin_MintCapability(_dummy: Value) returns (_struct: Value)
{
    assume is#Boolean(_dummy);
    _struct := Vector(ExtendValueArray(EmptyValueArray, _dummy));
}

procedure {:inline 1} Unpack_LibraCoin_MintCapability(_struct: Value) returns (_dummy: Value)
{
    assume is#Vector(_struct);
    _dummy := SelectField(_struct, LibraCoin_MintCapability__dummy);
    assume is#Boolean(_dummy);
}

const unique LibraCoin_MarketCap: TypeName;
const LibraCoin_MarketCap_total_value: FieldName;
axiom LibraCoin_MarketCap_total_value == 0;
function LibraCoin_MarketCap_type_value(): TypeValue {
    StructType(LibraCoin_MarketCap, ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()))
}
procedure {:inline 1} Pack_LibraCoin_MarketCap(total_value: Value) returns (_struct: Value)
{
    assume IsValidU128(total_value);
    _struct := Vector(ExtendValueArray(EmptyValueArray, total_value));
}

procedure {:inline 1} Unpack_LibraCoin_MarketCap(_struct: Value) returns (total_value: Value)
{
    assume is#Vector(_struct);
    total_value := SelectField(_struct, LibraCoin_MarketCap_total_value);
    assume IsValidU128(total_value);
}



// ** functions of module LibraCoin

procedure {:inline 1} LibraCoin_mint_with_default_capability (amount: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // IntegerType()
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(LibraCoin_MintCapability_type_value())
    var __t4: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#mint_with_default_capability#0#amount: [Position]Value;
    var debug#LibraCoin#mint_with_default_capability#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraCoin#mint_with_default_capability#0#amount := EmptyPositionMap;
    debug#LibraCoin#mint_with_default_capability#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 0, amount);
    debug#LibraCoin#mint_with_default_capability#0#amount := debug#LibraCoin#mint_with_default_capability#0#amount[Position(807) := amount];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), LibraCoin_MintCapability_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t4 := LibraCoin_mint(GetLocal(__m, __frame + 1), __t3);
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t4);

    __m := UpdateLocal(__m, __frame + 4, __t4);

    __ret0 := GetLocal(__m, __frame + 4);
    debug#LibraCoin#mint_with_default_capability#1#__ret := debug#LibraCoin#mint_with_default_capability#1#__ret[Position(909) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#mint_with_default_capability#1#__ret := debug#LibraCoin#mint_with_default_capability#1#__ret[Position(994) := __ret0];
}

procedure LibraCoin_mint_with_default_capability_verify (amount: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_mint_with_default_capability(amount);
}

procedure {:inline 1} LibraCoin_mint (value: Value, capability: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var total_value_ref: Reference; // ReferenceType(IntegerType())
    var __t3: Value; // IntegerType()
    var __t4: Value; // IntegerType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // BooleanType()
    var __t8: Value; // BooleanType()
    var __t9: Value; // IntegerType()
    var __t10: Value; // AddressType()
    var __t11: Reference; // ReferenceType(LibraCoin_MarketCap_type_value())
    var __t12: Reference; // ReferenceType(IntegerType())
    var __t13: Reference; // ReferenceType(IntegerType())
    var __t14: Value; // IntegerType()
    var __t15: Value; // IntegerType()
    var __t16: Value; // IntegerType()
    var __t17: Value; // IntegerType()
    var __t18: Reference; // ReferenceType(IntegerType())
    var __t19: Value; // IntegerType()
    var __t20: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#mint#0#value: [Position]Value;
    var debug#LibraCoin#mint#1#capability: [Position]Value;
    var debug#LibraCoin#mint#2#total_value_ref: [Position]Value;
    var debug#LibraCoin#mint#3#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 21;
    debug#LibraCoin#mint#0#value := EmptyPositionMap;
    debug#LibraCoin#mint#1#capability := EmptyPositionMap;
    debug#LibraCoin#mint#2#total_value_ref := EmptyPositionMap;
    debug#LibraCoin#mint#3#__ret := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(value);
    __m := UpdateLocal(__m, __frame + 0, value);
    debug#LibraCoin#mint#0#value := debug#LibraCoin#mint#0#value[Position(1231) := value];
    assume is#Vector(Dereference(__m, capability));
    assume IsValidReferenceParameter(__m, __frame, capability);
    debug#LibraCoin#mint#1#capability := debug#LibraCoin#mint#1#capability[Position(1231) := Dereference(__m, capability)];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := LdConst(1000000000);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := LdConst(1000000);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := MulU64(GetLocal(__m, __frame + 4), GetLocal(__m, __frame + 5));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := Le(GetLocal(__m, __frame + 3), GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    __tmp := GetLocal(__m, __frame + 8);
    if (!b#Boolean(__tmp)) { goto Label_9; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    goto Label_Abort;

Label_9:
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __t11 := BorrowGlobal(GetLocal(__m, __frame + 10), LibraCoin_MarketCap_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t12 := BorrowField(__t11, LibraCoin_MarketCap_total_value);

    call total_value_ref := CopyOrMoveRef(__t12);

    call __t13 := CopyOrMoveRef(total_value_ref);

    call __tmp := ReadRef(__t13);
    assume IsValidU128(__tmp);
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call __tmp := CastU128(GetLocal(__m, __frame + 15));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __tmp := AddU128(GetLocal(__m, __frame + 14), GetLocal(__m, __frame + 16));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 17, __tmp);

    call __t18 := CopyOrMoveRef(total_value_ref);

    call WriteRef(__t18, GetLocal(__m, __frame + 17));

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 19, __tmp);

    call __tmp := Pack_LibraCoin_T(GetLocal(__m, __frame + 19));
    __m := UpdateLocal(__m, __frame + 20, __tmp);

    __ret0 := GetLocal(__m, __frame + 20);
    debug#LibraCoin#mint#3#__ret := debug#LibraCoin#mint#3#__ret[Position(2067) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#mint#3#__ret := debug#LibraCoin#mint#3#__ret[Position(2101) := __ret0];
}

procedure LibraCoin_mint_verify (value: Value, capability: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_mint(value, capability);
}

procedure {:inline 1} LibraCoin_initialize () returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t0: Value; // AddressType()
    var __t1: Value; // AddressType()
    var __t2: Value; // BooleanType()
    var __t3: Value; // BooleanType()
    var __t4: Value; // IntegerType()
    var __t5: Value; // BooleanType()
    var __t6: Value; // LibraCoin_MintCapability_type_value()
    var __t7: Value; // IntegerType()
    var __t8: Value; // LibraCoin_MarketCap_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 9;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 0, __tmp);

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 0), GetLocal(__m, __frame + 1)));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __tmp := GetLocal(__m, __frame + 3);
    if (!b#Boolean(__tmp)) { goto Label_7; }

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    goto Label_Abort;

Label_7:
    call __tmp := LdTrue();
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := Pack_LibraCoin_MintCapability(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call MoveToSender(LibraCoin_MintCapability_type_value(), GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := Pack_LibraCoin_MarketCap(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call MoveToSender(LibraCoin_MarketCap_type_value(), GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraCoin_initialize_verify () returns ()
{
    call InitVerification();
    call LibraCoin_initialize();
}

procedure {:inline 1} LibraCoin_market_cap () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t0: Value; // AddressType()
    var __t1: Reference; // ReferenceType(LibraCoin_MarketCap_type_value())
    var __t2: Reference; // ReferenceType(IntegerType())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#market_cap#0#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraCoin#market_cap#0#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 0, __tmp);

    call __t1 := BorrowGlobal(GetLocal(__m, __frame + 0), LibraCoin_MarketCap_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t2 := BorrowField(__t1, LibraCoin_MarketCap_total_value);

    call __tmp := ReadRef(__t2);
    assume IsValidU128(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraCoin#market_cap#0#__ret := debug#LibraCoin#market_cap#0#__ret[Position(2657) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#market_cap#0#__ret := debug#LibraCoin#market_cap#0#__ret[Position(2721) := __ret0];
}

procedure LibraCoin_market_cap_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_market_cap();
}

procedure {:inline 1} LibraCoin_zero () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t0: Value; // IntegerType()
    var __t1: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#zero#0#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 2;
    debug#LibraCoin#zero#0#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 0, __tmp);

    call __tmp := Pack_LibraCoin_T(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    __ret0 := GetLocal(__m, __frame + 1);
    debug#LibraCoin#zero#0#__ret := debug#LibraCoin#zero#0#__ret[Position(2810) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#zero#0#__ret := debug#LibraCoin#zero#0#__ret[Position(2834) := __ret0];
}

procedure LibraCoin_zero_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_zero();
}

procedure {:inline 1} LibraCoin_value (coin_ref: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t2: Reference; // ReferenceType(IntegerType())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#value#0#coin_ref: [Position]Value;
    var debug#LibraCoin#value#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraCoin#value#0#coin_ref := EmptyPositionMap;
    debug#LibraCoin#value#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, coin_ref));
    assume IsValidReferenceParameter(__m, __frame, coin_ref);
    debug#LibraCoin#value#0#coin_ref := debug#LibraCoin#value#0#coin_ref[Position(2888) := Dereference(__m, coin_ref)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(coin_ref);

    call __t2 := BorrowField(__t1, LibraCoin_T_value);

    call __tmp := ReadRef(__t2);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraCoin#value#1#__ret := debug#LibraCoin#value#1#__ret[Position(2935) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#value#1#__ret := debug#LibraCoin#value#1#__ret[Position(2970) := __ret0];
}

procedure LibraCoin_value_verify (coin_ref: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_value(coin_ref);
}

procedure {:inline 1} LibraCoin_split (coin: Value, amount: Value) returns (__ret0: Value, __ret1: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var other: Value; // LibraCoin_T_type_value()
    var __t3: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t4: Value; // IntegerType()
    var __t5: Value; // LibraCoin_T_type_value()
    var __t6: Value; // LibraCoin_T_type_value()
    var __t7: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#split#0#coin: [Position]Value;
    var debug#LibraCoin#split#1#amount: [Position]Value;
    var debug#LibraCoin#split#2#other: [Position]Value;
    var debug#LibraCoin#split#3#__ret: [Position]Value;
    var debug#LibraCoin#split#4#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#LibraCoin#split#0#coin := EmptyPositionMap;
    debug#LibraCoin#split#1#amount := EmptyPositionMap;
    debug#LibraCoin#split#2#other := EmptyPositionMap;
    debug#LibraCoin#split#3#__ret := EmptyPositionMap;
    debug#LibraCoin#split#4#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(coin);
    __m := UpdateLocal(__m, __frame + 0, coin);
    debug#LibraCoin#split#0#coin := debug#LibraCoin#split#0#coin[Position(3109) := coin];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraCoin#split#1#amount := debug#LibraCoin#split#1#amount[Position(3109) := amount];

    // bytecode translation starts here
    call __t3 := BorrowLoc(__frame + 0);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := LibraCoin_withdraw(__t3, GetLocal(__m, __frame + 4));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t5);

    __m := UpdateLocal(__m, __frame + 5, __t5);
    debug#LibraCoin#split#0#coin := debug#LibraCoin#split#0#coin[Position(3211) := GetLocal(__m, __frame + 0)];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraCoin#split#2#other := debug#LibraCoin#split#2#other[Position(3203) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __ret0 := GetLocal(__m, __frame + 6);
    debug#LibraCoin#split#3#__ret := debug#LibraCoin#split#3#__ret[Position(3259) := __ret0];
    __ret1 := GetLocal(__m, __frame + 7);
    debug#LibraCoin#split#4#__ret := debug#LibraCoin#split#4#__ret[Position(3259) := __ret1];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#split#3#__ret := debug#LibraCoin#split#3#__ret[Position(3295) := __ret0];
    __ret1 := DefaultValue;
    debug#LibraCoin#split#4#__ret := debug#LibraCoin#split#4#__ret[Position(3295) := __ret1];
}

procedure LibraCoin_split_verify (coin: Value, amount: Value) returns (__ret0: Value, __ret1: Value)
{
    call InitVerification();
    call __ret0, __ret1 := LibraCoin_split(coin, amount);
}

procedure {:inline 1} LibraCoin_withdraw (coin_ref: Reference, amount: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var value: Value; // IntegerType()
    var __t3: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t4: Reference; // ReferenceType(IntegerType())
    var __t5: Value; // IntegerType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // IntegerType()
    var __t8: Value; // BooleanType()
    var __t9: Value; // BooleanType()
    var __t10: Value; // IntegerType()
    var __t11: Value; // IntegerType()
    var __t12: Value; // IntegerType()
    var __t13: Value; // IntegerType()
    var __t14: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t15: Reference; // ReferenceType(IntegerType())
    var __t16: Value; // IntegerType()
    var __t17: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#withdraw#0#coin_ref: [Position]Value;
    var debug#LibraCoin#withdraw#1#amount: [Position]Value;
    var debug#LibraCoin#withdraw#2#value: [Position]Value;
    var debug#LibraCoin#withdraw#3#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 18;
    debug#LibraCoin#withdraw#0#coin_ref := EmptyPositionMap;
    debug#LibraCoin#withdraw#1#amount := EmptyPositionMap;
    debug#LibraCoin#withdraw#2#value := EmptyPositionMap;
    debug#LibraCoin#withdraw#3#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, coin_ref));
    assume IsValidReferenceParameter(__m, __frame, coin_ref);
    debug#LibraCoin#withdraw#0#coin_ref := debug#LibraCoin#withdraw#0#coin_ref[Position(3557) := Dereference(__m, coin_ref)];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraCoin#withdraw#1#amount := debug#LibraCoin#withdraw#1#amount[Position(3557) := amount];

    // bytecode translation starts here
    call __t3 := CopyOrMoveRef(coin_ref);

    call __t4 := BorrowField(__t3, LibraCoin_T_value);

    call __tmp := ReadRef(__t4);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraCoin#withdraw#2#value := debug#LibraCoin#withdraw#2#value[Position(3713) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := Ge(GetLocal(__m, __frame + 6), GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 8));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    __tmp := GetLocal(__m, __frame + 9);
    if (!b#Boolean(__tmp)) { goto Label_11; }

    call __tmp := LdConst(10);
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    goto Label_Abort;

Label_11:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call __tmp := Sub(GetLocal(__m, __frame + 11), GetLocal(__m, __frame + 12));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __t14 := CopyOrMoveRef(coin_ref);

    call __t15 := BorrowField(__t14, LibraCoin_T_value);

    call WriteRef(__t15, GetLocal(__m, __frame + 13));

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __tmp := Pack_LibraCoin_T(GetLocal(__m, __frame + 16));
    __m := UpdateLocal(__m, __frame + 17, __tmp);

    __ret0 := GetLocal(__m, __frame + 17);
    debug#LibraCoin#withdraw#3#__ret := debug#LibraCoin#withdraw#3#__ret[Position(3902) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#withdraw#3#__ret := debug#LibraCoin#withdraw#3#__ret[Position(3937) := __ret0];
}

procedure LibraCoin_withdraw_verify (coin_ref: Reference, amount: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_withdraw(coin_ref, amount);
}

procedure {:inline 1} LibraCoin_join (coin1: Value, coin2: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t3: Value; // LibraCoin_T_type_value()
    var __t4: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#join#0#coin1: [Position]Value;
    var debug#LibraCoin#join#1#coin2: [Position]Value;
    var debug#LibraCoin#join#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraCoin#join#0#coin1 := EmptyPositionMap;
    debug#LibraCoin#join#1#coin2 := EmptyPositionMap;
    debug#LibraCoin#join#2#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(coin1);
    __m := UpdateLocal(__m, __frame + 0, coin1);
    debug#LibraCoin#join#0#coin1 := debug#LibraCoin#join#0#coin1[Position(4041) := coin1];
    assume is#Vector(coin2);
    __m := UpdateLocal(__m, __frame + 1, coin2);
    debug#LibraCoin#join#1#coin2 := debug#LibraCoin#join#1#coin2[Position(4041) := coin2];

    // bytecode translation starts here
    call __t2 := BorrowLoc(__frame + 0);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call LibraCoin_deposit(__t2, GetLocal(__m, __frame + 3));
    if (__abort_flag) { goto Label_Abort; }
    debug#LibraCoin#join#0#coin1 := debug#LibraCoin#join#0#coin1[Position(4102) := GetLocal(__m, __frame + 0)];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __ret0 := GetLocal(__m, __frame + 4);
    debug#LibraCoin#join#2#__ret := debug#LibraCoin#join#2#__ret[Position(4149) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraCoin#join#2#__ret := debug#LibraCoin#join#2#__ret[Position(4173) := __ret0];
}

procedure LibraCoin_join_verify (coin1: Value, coin2: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraCoin_join(coin1, coin2);
}

procedure {:inline 1} LibraCoin_deposit (coin_ref: Reference, check: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var value: Value; // IntegerType()
    var check_value: Value; // IntegerType()
    var __t4: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t5: Reference; // ReferenceType(IntegerType())
    var __t6: Value; // IntegerType()
    var __t7: Value; // LibraCoin_T_type_value()
    var __t8: Value; // IntegerType()
    var __t9: Value; // IntegerType()
    var __t10: Value; // IntegerType()
    var __t11: Value; // IntegerType()
    var __t12: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t13: Reference; // ReferenceType(IntegerType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#deposit#0#coin_ref: [Position]Value;
    var debug#LibraCoin#deposit#1#check: [Position]Value;
    var debug#LibraCoin#deposit#2#value: [Position]Value;
    var debug#LibraCoin#deposit#3#check_value: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 14;
    debug#LibraCoin#deposit#0#coin_ref := EmptyPositionMap;
    debug#LibraCoin#deposit#1#check := EmptyPositionMap;
    debug#LibraCoin#deposit#2#value := EmptyPositionMap;
    debug#LibraCoin#deposit#3#check_value := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, coin_ref));
    assume IsValidReferenceParameter(__m, __frame, coin_ref);
    debug#LibraCoin#deposit#0#coin_ref := debug#LibraCoin#deposit#0#coin_ref[Position(4352) := Dereference(__m, coin_ref)];
    assume is#Vector(check);
    __m := UpdateLocal(__m, __frame + 1, check);
    debug#LibraCoin#deposit#1#check := debug#LibraCoin#deposit#1#check[Position(4352) := check];

    // bytecode translation starts here
    call __t4 := CopyOrMoveRef(coin_ref);

    call __t5 := BorrowField(__t4, LibraCoin_T_value);

    call __tmp := ReadRef(__t5);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraCoin#deposit#2#value := debug#LibraCoin#deposit#2#value[Position(4470) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __t8 := Unpack_LibraCoin_T(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 8, __t8);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 8));
    __m := UpdateLocal(__m, __frame + 3, __tmp);
    debug#LibraCoin#deposit#3#check_value := debug#LibraCoin#deposit#3#check_value[Position(4520) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __tmp := AddU64(GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 10));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __t12 := CopyOrMoveRef(coin_ref);

    call __t13 := BorrowField(__t12, LibraCoin_T_value);

    call WriteRef(__t13, GetLocal(__m, __frame + 11));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraCoin_deposit_verify (coin_ref: Reference, check: Value) returns ()
{
    call InitVerification();
    call LibraCoin_deposit(coin_ref, check);
}

procedure {:inline 1} LibraCoin_destroy_zero (coin: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var value: Value; // IntegerType()
    var __t2: Value; // LibraCoin_T_type_value()
    var __t3: Value; // IntegerType()
    var __t4: Value; // IntegerType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // BooleanType()
    var __t7: Value; // BooleanType()
    var __t8: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraCoin#destroy_zero#0#coin: [Position]Value;
    var debug#LibraCoin#destroy_zero#1#value: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 9;
    debug#LibraCoin#destroy_zero#0#coin := EmptyPositionMap;
    debug#LibraCoin#destroy_zero#1#value := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(coin);
    __m := UpdateLocal(__m, __frame + 0, coin);
    debug#LibraCoin#destroy_zero#0#coin := debug#LibraCoin#destroy_zero#0#coin[Position(4858) := coin];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := Unpack_LibraCoin_T(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 3, __t3);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraCoin#destroy_zero#1#value := debug#LibraCoin#destroy_zero#1#value[Position(4930) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 4), GetLocal(__m, __frame + 5)));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __tmp := GetLocal(__m, __frame + 7);
    if (!b#Boolean(__tmp)) { goto Label_10; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    goto Label_Abort;

Label_10:
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraCoin_destroy_zero_verify (coin: Value) returns ()
{
    call InitVerification();
    call LibraCoin_destroy_zero(coin);
}



// ** structs of module LibraTimestamp

const unique LibraTimestamp_CurrentTimeMicroseconds: TypeName;
const LibraTimestamp_CurrentTimeMicroseconds_microseconds: FieldName;
axiom LibraTimestamp_CurrentTimeMicroseconds_microseconds == 0;
function LibraTimestamp_CurrentTimeMicroseconds_type_value(): TypeValue {
    StructType(LibraTimestamp_CurrentTimeMicroseconds, ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()))
}
procedure {:inline 1} Pack_LibraTimestamp_CurrentTimeMicroseconds(microseconds: Value) returns (_struct: Value)
{
    assume IsValidU64(microseconds);
    _struct := Vector(ExtendValueArray(EmptyValueArray, microseconds));
}

procedure {:inline 1} Unpack_LibraTimestamp_CurrentTimeMicroseconds(_struct: Value) returns (microseconds: Value)
{
    assume is#Vector(_struct);
    microseconds := SelectField(_struct, LibraTimestamp_CurrentTimeMicroseconds_microseconds);
    assume IsValidU64(microseconds);
}



// ** functions of module LibraTimestamp

procedure {:inline 1} LibraTimestamp_initialize_timer () returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var timer: Value; // LibraTimestamp_CurrentTimeMicroseconds_type_value()
    var __t1: Value; // AddressType()
    var __t2: Value; // AddressType()
    var __t3: Value; // BooleanType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // LibraTimestamp_CurrentTimeMicroseconds_type_value()
    var __t8: Value; // LibraTimestamp_CurrentTimeMicroseconds_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTimestamp#initialize_timer#0#timer: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 9;
    debug#LibraTimestamp#initialize_timer#0#timer := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 1), GetLocal(__m, __frame + 2)));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __tmp := GetLocal(__m, __frame + 4);
    if (!b#Boolean(__tmp)) { goto Label_7; }

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    goto Label_Abort;

Label_7:
    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := Pack_LibraTimestamp_CurrentTimeMicroseconds(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 0, __tmp);
    debug#LibraTimestamp#initialize_timer#0#timer := debug#LibraTimestamp#initialize_timer#0#timer[Position(490) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call MoveToSender(LibraTimestamp_CurrentTimeMicroseconds_type_value(), GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraTimestamp_initialize_timer_verify () returns ()
{
    call InitVerification();
    call LibraTimestamp_initialize_timer();
}

procedure {:inline 1} LibraTimestamp_update_global_time (proposer: Value, timestamp: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var global_timer: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t3: Value; // AddressType()
    var __t4: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t5: Value; // AddressType()
    var __t6: Value; // AddressType()
    var __t7: Value; // BooleanType()
    var __t8: Value; // IntegerType()
    var __t9: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t10: Reference; // ReferenceType(IntegerType())
    var __t11: Value; // IntegerType()
    var __t12: Value; // BooleanType()
    var __t13: Value; // BooleanType()
    var __t14: Value; // IntegerType()
    var __t15: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t16: Reference; // ReferenceType(IntegerType())
    var __t17: Value; // IntegerType()
    var __t18: Value; // IntegerType()
    var __t19: Value; // BooleanType()
    var __t20: Value; // BooleanType()
    var __t21: Value; // IntegerType()
    var __t22: Value; // IntegerType()
    var __t23: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t24: Reference; // ReferenceType(IntegerType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTimestamp#update_global_time#0#proposer: [Position]Value;
    var debug#LibraTimestamp#update_global_time#1#timestamp: [Position]Value;
    var debug#LibraTimestamp#update_global_time#2#global_timer: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 25;
    debug#LibraTimestamp#update_global_time#0#proposer := EmptyPositionMap;
    debug#LibraTimestamp#update_global_time#1#timestamp := EmptyPositionMap;
    debug#LibraTimestamp#update_global_time#2#global_timer := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(proposer);
    __m := UpdateLocal(__m, __frame + 0, proposer);
    debug#LibraTimestamp#update_global_time#0#proposer := debug#LibraTimestamp#update_global_time#0#proposer[Position(743) := proposer];
    assume IsValidU64(timestamp);
    __m := UpdateLocal(__m, __frame + 1, timestamp);
    debug#LibraTimestamp#update_global_time#1#timestamp := debug#LibraTimestamp#update_global_time#1#timestamp[Position(743) := timestamp];

    // bytecode translation starts here
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __t4 := BorrowGlobal(GetLocal(__m, __frame + 3), LibraTimestamp_CurrentTimeMicroseconds_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call global_timer := CopyOrMoveRef(__t4);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := LdAddr(0);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 5), GetLocal(__m, __frame + 6)));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __tmp := GetLocal(__m, __frame + 7);
    if (!b#Boolean(__tmp)) { goto Label_17; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __t9 := CopyOrMoveRef(global_timer);

    call __t10 := BorrowField(__t9, LibraTimestamp_CurrentTimeMicroseconds_microseconds);

    call __tmp := ReadRef(__t10);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 8), GetLocal(__m, __frame + 11)));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 12));
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    __tmp := GetLocal(__m, __frame + 13);
    if (!b#Boolean(__tmp)) { goto Label_16; }

    call __tmp := LdConst(5001);
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    goto Label_Abort;

Label_16:
    goto Label_26;

Label_17:
    call __t15 := CopyOrMoveRef(global_timer);

    call __t16 := BorrowField(__t15, LibraTimestamp_CurrentTimeMicroseconds_microseconds);

    call __tmp := ReadRef(__t16);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 17, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call __tmp := Lt(GetLocal(__m, __frame + 17), GetLocal(__m, __frame + 18));
    __m := UpdateLocal(__m, __frame + 19, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 19));
    __m := UpdateLocal(__m, __frame + 20, __tmp);

    __tmp := GetLocal(__m, __frame + 20);
    if (!b#Boolean(__tmp)) { goto Label_26; }

    call __tmp := LdConst(5001);
    __m := UpdateLocal(__m, __frame + 21, __tmp);

    goto Label_Abort;

Label_26:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 22, __tmp);

    call __t23 := CopyOrMoveRef(global_timer);

    call __t24 := BorrowField(__t23, LibraTimestamp_CurrentTimeMicroseconds_microseconds);

    call WriteRef(__t24, GetLocal(__m, __frame + 22));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraTimestamp_update_global_time_verify (proposer: Value, timestamp: Value) returns ()
{
    call InitVerification();
    call LibraTimestamp_update_global_time(proposer, timestamp);
}

procedure {:inline 1} LibraTimestamp_now_microseconds () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t0: Value; // AddressType()
    var __t1: Reference; // ReferenceType(LibraTimestamp_CurrentTimeMicroseconds_type_value())
    var __t2: Reference; // ReferenceType(IntegerType())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTimestamp#now_microseconds#0#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraTimestamp#now_microseconds#0#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 0, __tmp);

    call __t1 := BorrowGlobal(GetLocal(__m, __frame + 0), LibraTimestamp_CurrentTimeMicroseconds_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t2 := BorrowField(__t1, LibraTimestamp_CurrentTimeMicroseconds_microseconds);

    call __tmp := ReadRef(__t2);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraTimestamp#now_microseconds#0#__ret := debug#LibraTimestamp#now_microseconds#0#__ret[Position(1736) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraTimestamp#now_microseconds#0#__ret := debug#LibraTimestamp#now_microseconds#0#__ret[Position(1815) := __ret0];
}

procedure LibraTimestamp_now_microseconds_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraTimestamp_now_microseconds();
}



// ** structs of module LibraTransactionTimeout

const unique LibraTransactionTimeout_TTL: TypeName;
const LibraTransactionTimeout_TTL_duration_microseconds: FieldName;
axiom LibraTransactionTimeout_TTL_duration_microseconds == 0;
function LibraTransactionTimeout_TTL_type_value(): TypeValue {
    StructType(LibraTransactionTimeout_TTL, ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()))
}
procedure {:inline 1} Pack_LibraTransactionTimeout_TTL(duration_microseconds: Value) returns (_struct: Value)
{
    assume IsValidU64(duration_microseconds);
    _struct := Vector(ExtendValueArray(EmptyValueArray, duration_microseconds));
}

procedure {:inline 1} Unpack_LibraTransactionTimeout_TTL(_struct: Value) returns (duration_microseconds: Value)
{
    assume is#Vector(_struct);
    duration_microseconds := SelectField(_struct, LibraTransactionTimeout_TTL_duration_microseconds);
    assume IsValidU64(duration_microseconds);
}



// ** functions of module LibraTransactionTimeout

procedure {:inline 1} LibraTransactionTimeout_initialize () returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var timeout: Value; // LibraTransactionTimeout_TTL_type_value()
    var __t1: Value; // AddressType()
    var __t2: Value; // AddressType()
    var __t3: Value; // BooleanType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // LibraTransactionTimeout_TTL_type_value()
    var __t8: Value; // LibraTransactionTimeout_TTL_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTransactionTimeout#initialize#0#timeout: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 9;
    debug#LibraTransactionTimeout#initialize#0#timeout := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 1), GetLocal(__m, __frame + 2)));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __tmp := GetLocal(__m, __frame + 4);
    if (!b#Boolean(__tmp)) { goto Label_7; }

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    goto Label_Abort;

Label_7:
    call __tmp := LdConst(86400000000);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := Pack_LibraTransactionTimeout_TTL(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 0, __tmp);
    debug#LibraTransactionTimeout#initialize#0#timeout := debug#LibraTransactionTimeout#initialize#0#timeout[Position(441) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call MoveToSender(LibraTransactionTimeout_TTL_type_value(), GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraTransactionTimeout_initialize_verify () returns ()
{
    call InitVerification();
    call LibraTransactionTimeout_initialize();
}

procedure {:inline 1} LibraTransactionTimeout_set_timeout (new_duration: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var timeout: Reference; // ReferenceType(LibraTransactionTimeout_TTL_type_value())
    var __t2: Value; // AddressType()
    var __t3: Value; // AddressType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // BooleanType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // AddressType()
    var __t8: Reference; // ReferenceType(LibraTransactionTimeout_TTL_type_value())
    var __t9: Value; // IntegerType()
    var __t10: Reference; // ReferenceType(LibraTransactionTimeout_TTL_type_value())
    var __t11: Reference; // ReferenceType(IntegerType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTransactionTimeout#set_timeout#0#new_duration: [Position]Value;
    var debug#LibraTransactionTimeout#set_timeout#1#timeout: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 12;
    debug#LibraTransactionTimeout#set_timeout#0#new_duration := EmptyPositionMap;
    debug#LibraTransactionTimeout#set_timeout#1#timeout := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(new_duration);
    __m := UpdateLocal(__m, __frame + 0, new_duration);
    debug#LibraTransactionTimeout#set_timeout#0#new_duration := debug#LibraTransactionTimeout#set_timeout#0#new_duration[Position(564) := new_duration];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 2), GetLocal(__m, __frame + 3)));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    __tmp := GetLocal(__m, __frame + 5);
    if (!b#Boolean(__tmp)) { goto Label_7; }

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    goto Label_Abort;

Label_7:
    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __t8 := BorrowGlobal(GetLocal(__m, __frame + 7), LibraTransactionTimeout_TTL_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call timeout := CopyOrMoveRef(__t8);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := CopyOrMoveRef(timeout);

    call __t11 := BorrowField(__t10, LibraTransactionTimeout_TTL_duration_microseconds);

    call WriteRef(__t11, GetLocal(__m, __frame + 9));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraTransactionTimeout_set_timeout_verify (new_duration: Value) returns ()
{
    call InitVerification();
    call LibraTransactionTimeout_set_timeout(new_duration);
}

procedure {:inline 1} LibraTransactionTimeout_is_valid_transaction_timestamp (timestamp: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var current_block_time: Value; // IntegerType()
    var max_txn_time: Value; // IntegerType()
    var timeout: Value; // IntegerType()
    var txn_time_microseconds: Value; // IntegerType()
    var __t5: Value; // IntegerType()
    var __t6: Value; // IntegerType()
    var __t7: Value; // BooleanType()
    var __t8: Value; // BooleanType()
    var __t9: Value; // IntegerType()
    var __t10: Value; // AddressType()
    var __t11: Reference; // ReferenceType(LibraTransactionTimeout_TTL_type_value())
    var __t12: Reference; // ReferenceType(IntegerType())
    var __t13: Value; // IntegerType()
    var __t14: Value; // IntegerType()
    var __t15: Value; // IntegerType()
    var __t16: Value; // IntegerType()
    var __t17: Value; // IntegerType()
    var __t18: Value; // IntegerType()
    var __t19: Value; // IntegerType()
    var __t20: Value; // IntegerType()
    var __t21: Value; // IntegerType()
    var __t22: Value; // BooleanType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#0#timestamp: [Position]Value;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#1#current_block_time: [Position]Value;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#2#max_txn_time: [Position]Value;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#3#timeout: [Position]Value;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#4#txn_time_microseconds: [Position]Value;
    var debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 23;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#0#timestamp := EmptyPositionMap;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#1#current_block_time := EmptyPositionMap;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#2#max_txn_time := EmptyPositionMap;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#3#timeout := EmptyPositionMap;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#4#txn_time_microseconds := EmptyPositionMap;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(timestamp);
    __m := UpdateLocal(__m, __frame + 0, timestamp);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#0#timestamp := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#0#timestamp[Position(911) := timestamp];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := LdConst(9223372036854);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := Gt(GetLocal(__m, __frame + 5), GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __tmp := GetLocal(__m, __frame + 7);
    if (!b#Boolean(__tmp)) { goto Label_6; }

    call __tmp := LdFalse();
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    __ret0 := GetLocal(__m, __frame + 8);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret[Position(1242) := __ret0];
    return;

Label_6:
    call __t9 := LibraTimestamp_now_microseconds();
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t9);

    __m := UpdateLocal(__m, __frame + 9, __t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 9));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#1#current_block_time := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#1#current_block_time[Position(1275) := __tmp];

    call __tmp := LdAddr(173345816);
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __t11 := BorrowGlobal(GetLocal(__m, __frame + 10), LibraTransactionTimeout_TTL_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t12 := BorrowField(__t11, LibraTransactionTimeout_TTL_duration_microseconds);

    call __tmp := ReadRef(__t12);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 13));
    __m := UpdateLocal(__m, __frame + 3, __tmp);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#3#timeout := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#3#timeout[Position(1339) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call __tmp := AddU64(GetLocal(__m, __frame + 14), GetLocal(__m, __frame + 15));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 16));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#2#max_txn_time := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#2#max_txn_time[Position(1412) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 17, __tmp);

    call __tmp := LdConst(1000000);
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call __tmp := MulU64(GetLocal(__m, __frame + 17), GetLocal(__m, __frame + 18));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 19, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 19));
    __m := UpdateLocal(__m, __frame + 4, __tmp);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#4#txn_time_microseconds := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#4#txn_time_microseconds[Position(1478) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 20, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 21, __tmp);

    call __tmp := Lt(GetLocal(__m, __frame + 20), GetLocal(__m, __frame + 21));
    __m := UpdateLocal(__m, __frame + 22, __tmp);

    __ret0 := GetLocal(__m, __frame + 22);
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret[Position(1893) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret := debug#LibraTransactionTimeout#is_valid_transaction_timestamp#5#__ret[Position(1960) := __ret0];
}

procedure LibraTransactionTimeout_is_valid_transaction_timestamp_verify (timestamp: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraTransactionTimeout_is_valid_transaction_timestamp(timestamp);
}



// ** structs of module LibraAccount

const unique LibraAccount_T: TypeName;
const LibraAccount_T_authentication_key: FieldName;
axiom LibraAccount_T_authentication_key == 0;
const LibraAccount_T_balance: FieldName;
axiom LibraAccount_T_balance == 1;
const LibraAccount_T_delegated_key_rotation_capability: FieldName;
axiom LibraAccount_T_delegated_key_rotation_capability == 2;
const LibraAccount_T_delegated_withdrawal_capability: FieldName;
axiom LibraAccount_T_delegated_withdrawal_capability == 3;
const LibraAccount_T_received_events: FieldName;
axiom LibraAccount_T_received_events == 4;
const LibraAccount_T_sent_events: FieldName;
axiom LibraAccount_T_sent_events == 5;
const LibraAccount_T_sequence_number: FieldName;
axiom LibraAccount_T_sequence_number == 6;
const LibraAccount_T_event_generator: FieldName;
axiom LibraAccount_T_event_generator == 7;
axiom LibraAccount_T_type_value() == StructType(LibraAccount_T, ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, ByteArrayType()), LibraCoin_T_type_value()), BooleanType()), BooleanType()), LibraAccount_EventHandle_type_value(LibraAccount_ReceivedPaymentEvent_type_value())), LibraAccount_EventHandle_type_value(LibraAccount_SentPaymentEvent_type_value())), IntegerType()), LibraAccount_EventHandleGenerator_type_value()));
procedure {:inline 1} Pack_LibraAccount_T(authentication_key: Value, balance: Value, delegated_key_rotation_capability: Value, delegated_withdrawal_capability: Value, received_events: Value, sent_events: Value, sequence_number: Value, event_generator: Value) returns (_struct: Value)
{
    assume is#ByteArray(authentication_key);
    assume is#Vector(balance);
    assume is#Boolean(delegated_key_rotation_capability);
    assume is#Boolean(delegated_withdrawal_capability);
    assume is#Vector(received_events);
    assume is#Vector(sent_events);
    assume IsValidU64(sequence_number);
    assume is#Vector(event_generator);
    _struct := Vector(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(ExtendValueArray(EmptyValueArray, authentication_key), balance), delegated_key_rotation_capability), delegated_withdrawal_capability), received_events), sent_events), sequence_number), event_generator));
}

procedure {:inline 1} Unpack_LibraAccount_T(_struct: Value) returns (authentication_key: Value, balance: Value, delegated_key_rotation_capability: Value, delegated_withdrawal_capability: Value, received_events: Value, sent_events: Value, sequence_number: Value, event_generator: Value)
{
    assume is#Vector(_struct);
    authentication_key := SelectField(_struct, LibraAccount_T_authentication_key);
    assume is#ByteArray(authentication_key);
    balance := SelectField(_struct, LibraAccount_T_balance);
    assume is#Vector(balance);
    delegated_key_rotation_capability := SelectField(_struct, LibraAccount_T_delegated_key_rotation_capability);
    assume is#Boolean(delegated_key_rotation_capability);
    delegated_withdrawal_capability := SelectField(_struct, LibraAccount_T_delegated_withdrawal_capability);
    assume is#Boolean(delegated_withdrawal_capability);
    received_events := SelectField(_struct, LibraAccount_T_received_events);
    assume is#Vector(received_events);
    sent_events := SelectField(_struct, LibraAccount_T_sent_events);
    assume is#Vector(sent_events);
    sequence_number := SelectField(_struct, LibraAccount_T_sequence_number);
    assume IsValidU64(sequence_number);
    event_generator := SelectField(_struct, LibraAccount_T_event_generator);
    assume is#Vector(event_generator);
}

const unique LibraAccount_WithdrawalCapability: TypeName;
const LibraAccount_WithdrawalCapability_account_address: FieldName;
axiom LibraAccount_WithdrawalCapability_account_address == 0;
function LibraAccount_WithdrawalCapability_type_value(): TypeValue {
    StructType(LibraAccount_WithdrawalCapability, ExtendTypeValueArray(EmptyTypeValueArray, AddressType()))
}
procedure {:inline 1} Pack_LibraAccount_WithdrawalCapability(account_address: Value) returns (_struct: Value)
{
    assume is#Address(account_address);
    _struct := Vector(ExtendValueArray(EmptyValueArray, account_address));
}

procedure {:inline 1} Unpack_LibraAccount_WithdrawalCapability(_struct: Value) returns (account_address: Value)
{
    assume is#Vector(_struct);
    account_address := SelectField(_struct, LibraAccount_WithdrawalCapability_account_address);
    assume is#Address(account_address);
}

const unique LibraAccount_KeyRotationCapability: TypeName;
const LibraAccount_KeyRotationCapability_account_address: FieldName;
axiom LibraAccount_KeyRotationCapability_account_address == 0;
function LibraAccount_KeyRotationCapability_type_value(): TypeValue {
    StructType(LibraAccount_KeyRotationCapability, ExtendTypeValueArray(EmptyTypeValueArray, AddressType()))
}
procedure {:inline 1} Pack_LibraAccount_KeyRotationCapability(account_address: Value) returns (_struct: Value)
{
    assume is#Address(account_address);
    _struct := Vector(ExtendValueArray(EmptyValueArray, account_address));
}

procedure {:inline 1} Unpack_LibraAccount_KeyRotationCapability(_struct: Value) returns (account_address: Value)
{
    assume is#Vector(_struct);
    account_address := SelectField(_struct, LibraAccount_KeyRotationCapability_account_address);
    assume is#Address(account_address);
}

const unique LibraAccount_SentPaymentEvent: TypeName;
const LibraAccount_SentPaymentEvent_amount: FieldName;
axiom LibraAccount_SentPaymentEvent_amount == 0;
const LibraAccount_SentPaymentEvent_payee: FieldName;
axiom LibraAccount_SentPaymentEvent_payee == 1;
const LibraAccount_SentPaymentEvent_metadata: FieldName;
axiom LibraAccount_SentPaymentEvent_metadata == 2;
function LibraAccount_SentPaymentEvent_type_value(): TypeValue {
    StructType(LibraAccount_SentPaymentEvent, ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()), AddressType()), ByteArrayType()))
}
procedure {:inline 1} Pack_LibraAccount_SentPaymentEvent(amount: Value, payee: Value, metadata: Value) returns (_struct: Value)
{
    assume IsValidU64(amount);
    assume is#Address(payee);
    assume is#ByteArray(metadata);
    _struct := Vector(ExtendValueArray(ExtendValueArray(ExtendValueArray(EmptyValueArray, amount), payee), metadata));
}

procedure {:inline 1} Unpack_LibraAccount_SentPaymentEvent(_struct: Value) returns (amount: Value, payee: Value, metadata: Value)
{
    assume is#Vector(_struct);
    amount := SelectField(_struct, LibraAccount_SentPaymentEvent_amount);
    assume IsValidU64(amount);
    payee := SelectField(_struct, LibraAccount_SentPaymentEvent_payee);
    assume is#Address(payee);
    metadata := SelectField(_struct, LibraAccount_SentPaymentEvent_metadata);
    assume is#ByteArray(metadata);
}

const unique LibraAccount_ReceivedPaymentEvent: TypeName;
const LibraAccount_ReceivedPaymentEvent_amount: FieldName;
axiom LibraAccount_ReceivedPaymentEvent_amount == 0;
const LibraAccount_ReceivedPaymentEvent_payer: FieldName;
axiom LibraAccount_ReceivedPaymentEvent_payer == 1;
const LibraAccount_ReceivedPaymentEvent_metadata: FieldName;
axiom LibraAccount_ReceivedPaymentEvent_metadata == 2;
function LibraAccount_ReceivedPaymentEvent_type_value(): TypeValue {
    StructType(LibraAccount_ReceivedPaymentEvent, ExtendTypeValueArray(ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()), AddressType()), ByteArrayType()))
}
procedure {:inline 1} Pack_LibraAccount_ReceivedPaymentEvent(amount: Value, payer: Value, metadata: Value) returns (_struct: Value)
{
    assume IsValidU64(amount);
    assume is#Address(payer);
    assume is#ByteArray(metadata);
    _struct := Vector(ExtendValueArray(ExtendValueArray(ExtendValueArray(EmptyValueArray, amount), payer), metadata));
}

procedure {:inline 1} Unpack_LibraAccount_ReceivedPaymentEvent(_struct: Value) returns (amount: Value, payer: Value, metadata: Value)
{
    assume is#Vector(_struct);
    amount := SelectField(_struct, LibraAccount_ReceivedPaymentEvent_amount);
    assume IsValidU64(amount);
    payer := SelectField(_struct, LibraAccount_ReceivedPaymentEvent_payer);
    assume is#Address(payer);
    metadata := SelectField(_struct, LibraAccount_ReceivedPaymentEvent_metadata);
    assume is#ByteArray(metadata);
}

const unique LibraAccount_EventHandleGenerator: TypeName;
const LibraAccount_EventHandleGenerator_counter: FieldName;
axiom LibraAccount_EventHandleGenerator_counter == 0;
function LibraAccount_EventHandleGenerator_type_value(): TypeValue {
    StructType(LibraAccount_EventHandleGenerator, ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()))
}
procedure {:inline 1} Pack_LibraAccount_EventHandleGenerator(counter: Value) returns (_struct: Value)
{
    assume IsValidU64(counter);
    _struct := Vector(ExtendValueArray(EmptyValueArray, counter));
}

procedure {:inline 1} Unpack_LibraAccount_EventHandleGenerator(_struct: Value) returns (counter: Value)
{
    assume is#Vector(_struct);
    counter := SelectField(_struct, LibraAccount_EventHandleGenerator_counter);
    assume IsValidU64(counter);
}

const unique LibraAccount_EventHandle: TypeName;
const LibraAccount_EventHandle_counter: FieldName;
axiom LibraAccount_EventHandle_counter == 0;
const LibraAccount_EventHandle_guid: FieldName;
axiom LibraAccount_EventHandle_guid == 1;
function LibraAccount_EventHandle_type_value(tv0: TypeValue): TypeValue {
    StructType(LibraAccount_EventHandle, ExtendTypeValueArray(ExtendTypeValueArray(EmptyTypeValueArray, IntegerType()), ByteArrayType()))
}
procedure {:inline 1} Pack_LibraAccount_EventHandle(tv0: TypeValue, counter: Value, guid: Value) returns (_struct: Value)
{
    assume IsValidU64(counter);
    assume is#ByteArray(guid);
    _struct := Vector(ExtendValueArray(ExtendValueArray(EmptyValueArray, counter), guid));
}

procedure {:inline 1} Unpack_LibraAccount_EventHandle(_struct: Value) returns (counter: Value, guid: Value)
{
    assume is#Vector(_struct);
    counter := SelectField(_struct, LibraAccount_EventHandle_counter);
    assume IsValidU64(counter);
    guid := SelectField(_struct, LibraAccount_EventHandle_guid);
    assume is#ByteArray(guid);
}



// ** functions of module LibraAccount

procedure {:inline 1} LibraAccount_deposit (payee: Value, to_deposit: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // AddressType()
    var __t3: Value; // LibraCoin_T_type_value()
    var __t4: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#deposit#0#payee: [Position]Value;
    var debug#LibraAccount#deposit#1#to_deposit: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraAccount#deposit#0#payee := EmptyPositionMap;
    debug#LibraAccount#deposit#1#to_deposit := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#deposit#0#payee := debug#LibraAccount#deposit#0#payee[Position(3305) := payee];
    assume is#Vector(to_deposit);
    __m := UpdateLocal(__m, __frame + 1, to_deposit);
    debug#LibraAccount#deposit#1#to_deposit := debug#LibraAccount#deposit#1#to_deposit[Position(3305) := to_deposit];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    // unimplemented instruction: LdByteArray(4, ByteArrayPoolIndex(0))

    call LibraAccount_deposit_with_metadata(GetLocal(__m, __frame + 2), GetLocal(__m, __frame + 3), GetLocal(__m, __frame + 4));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_deposit_verify (payee: Value, to_deposit: Value) returns ()
{
    call InitVerification();
    call LibraAccount_deposit(payee, to_deposit);
}

procedure {:inline 1} LibraAccount_deposit_with_metadata (payee: Value, to_deposit: Value, metadata: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t3: Value; // AddressType()
    var __t4: Value; // AddressType()
    var __t5: Value; // LibraCoin_T_type_value()
    var __t6: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#deposit_with_metadata#0#payee: [Position]Value;
    var debug#LibraAccount#deposit_with_metadata#1#to_deposit: [Position]Value;
    var debug#LibraAccount#deposit_with_metadata#2#metadata: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 7;
    debug#LibraAccount#deposit_with_metadata#0#payee := EmptyPositionMap;
    debug#LibraAccount#deposit_with_metadata#1#to_deposit := EmptyPositionMap;
    debug#LibraAccount#deposit_with_metadata#2#metadata := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#deposit_with_metadata#0#payee := debug#LibraAccount#deposit_with_metadata#0#payee[Position(3567) := payee];
    assume is#Vector(to_deposit);
    __m := UpdateLocal(__m, __frame + 1, to_deposit);
    debug#LibraAccount#deposit_with_metadata#1#to_deposit := debug#LibraAccount#deposit_with_metadata#1#to_deposit[Position(3567) := to_deposit];
    assume is#ByteArray(metadata);
    __m := UpdateLocal(__m, __frame + 2, metadata);
    debug#LibraAccount#deposit_with_metadata#2#metadata := debug#LibraAccount#deposit_with_metadata#2#metadata[Position(3567) := metadata];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call LibraAccount_deposit_with_sender_and_metadata(GetLocal(__m, __frame + 3), GetLocal(__m, __frame + 4), GetLocal(__m, __frame + 5), GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_deposit_with_metadata_verify (payee: Value, to_deposit: Value, metadata: Value) returns ()
{
    call InitVerification();
    call LibraAccount_deposit_with_metadata(payee, to_deposit, metadata);
}

procedure {:inline 1} LibraAccount_deposit_with_sender_and_metadata (payee: Value, sender: Value, to_deposit: Value, metadata: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var deposit_value: Value; // IntegerType()
    var payee_account_ref: Reference; // ReferenceType(LibraAccount_T_type_value())
    var sender_account_ref: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t7: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t8: Value; // IntegerType()
    var __t9: Value; // IntegerType()
    var __t10: Value; // IntegerType()
    var __t11: Value; // BooleanType()
    var __t12: Value; // BooleanType()
    var __t13: Value; // IntegerType()
    var __t14: Value; // AddressType()
    var __t15: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t16: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t17: Reference; // ReferenceType(LibraAccount_EventHandle_type_value(LibraAccount_SentPaymentEvent_type_value()))
    var __t18: Value; // IntegerType()
    var __t19: Value; // AddressType()
    var __t20: Value; // ByteArrayType()
    var __t21: Value; // LibraAccount_SentPaymentEvent_type_value()
    var __t22: Value; // AddressType()
    var __t23: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t24: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t25: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t26: Value; // LibraCoin_T_type_value()
    var __t27: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t28: Reference; // ReferenceType(LibraAccount_EventHandle_type_value(LibraAccount_ReceivedPaymentEvent_type_value()))
    var __t29: Value; // IntegerType()
    var __t30: Value; // AddressType()
    var __t31: Value; // ByteArrayType()
    var __t32: Value; // LibraAccount_ReceivedPaymentEvent_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#deposit_with_sender_and_metadata#0#payee: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#1#sender: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#2#to_deposit: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#3#metadata: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#4#deposit_value: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#5#payee_account_ref: [Position]Value;
    var debug#LibraAccount#deposit_with_sender_and_metadata#6#sender_account_ref: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 33;
    debug#LibraAccount#deposit_with_sender_and_metadata#0#payee := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#1#sender := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#2#to_deposit := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#3#metadata := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#4#deposit_value := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#5#payee_account_ref := EmptyPositionMap;
    debug#LibraAccount#deposit_with_sender_and_metadata#6#sender_account_ref := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#deposit_with_sender_and_metadata#0#payee := debug#LibraAccount#deposit_with_sender_and_metadata#0#payee[Position(4018) := payee];
    assume is#Address(sender);
    __m := UpdateLocal(__m, __frame + 1, sender);
    debug#LibraAccount#deposit_with_sender_and_metadata#1#sender := debug#LibraAccount#deposit_with_sender_and_metadata#1#sender[Position(4018) := sender];
    assume is#Vector(to_deposit);
    __m := UpdateLocal(__m, __frame + 2, to_deposit);
    debug#LibraAccount#deposit_with_sender_and_metadata#2#to_deposit := debug#LibraAccount#deposit_with_sender_and_metadata#2#to_deposit[Position(4018) := to_deposit];
    assume is#ByteArray(metadata);
    __m := UpdateLocal(__m, __frame + 3, metadata);
    debug#LibraAccount#deposit_with_sender_and_metadata#3#metadata := debug#LibraAccount#deposit_with_sender_and_metadata#3#metadata[Position(4018) := metadata];

    // bytecode translation starts here
    call __t7 := BorrowLoc(__frame + 2);

    call __t8 := LibraCoin_value(__t7);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t8);

    __m := UpdateLocal(__m, __frame + 8, __t8);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 8));
    __m := UpdateLocal(__m, __frame + 4, __tmp);
    debug#LibraAccount#deposit_with_sender_and_metadata#4#deposit_value := debug#LibraAccount#deposit_with_sender_and_metadata#4#deposit_value[Position(4367) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call __tmp := Gt(GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 10));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 11));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    __tmp := GetLocal(__m, __frame + 12);
    if (!b#Boolean(__tmp)) { goto Label_10; }

    call __tmp := LdConst(7);
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    goto Label_Abort;

Label_10:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __t15 := BorrowGlobal(GetLocal(__m, __frame + 14), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account_ref := CopyOrMoveRef(__t15);

    call __t16 := CopyOrMoveRef(sender_account_ref);

    call __t17 := BorrowField(__t16, LibraAccount_T_sent_events);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 19, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 20, __tmp);

    call __tmp := Pack_LibraAccount_SentPaymentEvent(GetLocal(__m, __frame + 18), GetLocal(__m, __frame + 19), GetLocal(__m, __frame + 20));
    __m := UpdateLocal(__m, __frame + 21, __tmp);

    call LibraAccount_emit_event(LibraAccount_SentPaymentEvent_type_value(), __t17, GetLocal(__m, __frame + 21));
    if (__abort_flag) { goto Label_Abort; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 22, __tmp);

    call __t23 := BorrowGlobal(GetLocal(__m, __frame + 22), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call payee_account_ref := CopyOrMoveRef(__t23);

    call __t24 := CopyOrMoveRef(payee_account_ref);

    call __t25 := BorrowField(__t24, LibraAccount_T_balance);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 26, __tmp);

    call LibraCoin_deposit(__t25, GetLocal(__m, __frame + 26));
    if (__abort_flag) { goto Label_Abort; }

    call __t27 := CopyOrMoveRef(payee_account_ref);

    call __t28 := BorrowField(__t27, LibraAccount_T_received_events);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 29, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 30, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 31, __tmp);

    call __tmp := Pack_LibraAccount_ReceivedPaymentEvent(GetLocal(__m, __frame + 29), GetLocal(__m, __frame + 30), GetLocal(__m, __frame + 31));
    __m := UpdateLocal(__m, __frame + 32, __tmp);

    call LibraAccount_emit_event(LibraAccount_ReceivedPaymentEvent_type_value(), __t28, GetLocal(__m, __frame + 32));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_deposit_with_sender_and_metadata_verify (payee: Value, sender: Value, to_deposit: Value, metadata: Value) returns ()
{
    call InitVerification();
    call LibraAccount_deposit_with_sender_and_metadata(payee, sender, to_deposit, metadata);
}

procedure {:inline 1} LibraAccount_mint_to_address (payee: Value, amount: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // AddressType()
    var __t3: Value; // BooleanType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // AddressType()
    var __t6: Value; // AddressType()
    var __t7: Value; // IntegerType()
    var __t8: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#mint_to_address#0#payee: [Position]Value;
    var debug#LibraAccount#mint_to_address#1#amount: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 9;
    debug#LibraAccount#mint_to_address#0#payee := EmptyPositionMap;
    debug#LibraAccount#mint_to_address#1#amount := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#mint_to_address#0#payee := debug#LibraAccount#mint_to_address#0#payee[Position(5776) := payee];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraAccount#mint_to_address#1#amount := debug#LibraAccount#mint_to_address#1#amount[Position(5776) := amount];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 2), LibraAccount_T_type_value());
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __tmp := GetLocal(__m, __frame + 4);
    if (!b#Boolean(__tmp)) { goto Label_6; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call LibraAccount_create_account(GetLocal(__m, __frame + 5));
    if (__abort_flag) { goto Label_Abort; }

Label_6:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __t8 := LibraCoin_mint_with_default_capability(GetLocal(__m, __frame + 7));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t8);

    __m := UpdateLocal(__m, __frame + 8, __t8);

    call LibraAccount_deposit(GetLocal(__m, __frame + 6), GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_mint_to_address_verify (payee: Value, amount: Value) returns ()
{
    call InitVerification();
    call LibraAccount_mint_to_address(payee, amount);
}

procedure {:inline 1} LibraAccount_withdraw_from_account (account: Reference, amount: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var to_withdraw: Value; // LibraCoin_T_type_value()
    var __t3: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t4: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t5: Value; // IntegerType()
    var __t6: Value; // LibraCoin_T_type_value()
    var __t7: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#withdraw_from_account#0#account: [Position]Value;
    var debug#LibraAccount#withdraw_from_account#1#amount: [Position]Value;
    var debug#LibraAccount#withdraw_from_account#2#to_withdraw: [Position]Value;
    var debug#LibraAccount#withdraw_from_account#3#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#LibraAccount#withdraw_from_account#0#account := EmptyPositionMap;
    debug#LibraAccount#withdraw_from_account#1#amount := EmptyPositionMap;
    debug#LibraAccount#withdraw_from_account#2#to_withdraw := EmptyPositionMap;
    debug#LibraAccount#withdraw_from_account#3#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, account));
    assume IsValidReferenceParameter(__m, __frame, account);
    debug#LibraAccount#withdraw_from_account#0#account := debug#LibraAccount#withdraw_from_account#0#account[Position(6237) := Dereference(__m, account)];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraAccount#withdraw_from_account#1#amount := debug#LibraAccount#withdraw_from_account#1#amount[Position(6237) := amount];

    // bytecode translation starts here
    call __t3 := CopyOrMoveRef(account);

    call __t4 := BorrowField(__t3, LibraAccount_T_balance);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __t6 := LibraCoin_withdraw(__t4, GetLocal(__m, __frame + 5));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t6);

    __m := UpdateLocal(__m, __frame + 6, __t6);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraAccount#withdraw_from_account#2#to_withdraw := debug#LibraAccount#withdraw_from_account#2#to_withdraw[Position(6356) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __ret0 := GetLocal(__m, __frame + 7);
    debug#LibraAccount#withdraw_from_account#3#__ret := debug#LibraAccount#withdraw_from_account#3#__ret[Position(6440) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#withdraw_from_account#3#__ret := debug#LibraAccount#withdraw_from_account#3#__ret[Position(6470) := __ret0];
}

procedure LibraAccount_withdraw_from_account_verify (account: Reference, amount: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_withdraw_from_account(account, amount);
}

procedure {:inline 1} LibraAccount_withdraw_from_sender (amount: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t4: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t5: Reference; // ReferenceType(BooleanType())
    var __t6: Value; // BooleanType()
    var __t7: Value; // IntegerType()
    var __t8: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t9: Value; // IntegerType()
    var __t10: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#withdraw_from_sender#0#amount: [Position]Value;
    var debug#LibraAccount#withdraw_from_sender#1#sender_account: [Position]Value;
    var debug#LibraAccount#withdraw_from_sender#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 11;
    debug#LibraAccount#withdraw_from_sender#0#amount := EmptyPositionMap;
    debug#LibraAccount#withdraw_from_sender#1#sender_account := EmptyPositionMap;
    debug#LibraAccount#withdraw_from_sender#2#__ret := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 0, amount);
    debug#LibraAccount#withdraw_from_sender#0#amount := debug#LibraAccount#withdraw_from_sender#0#amount[Position(6552) := amount];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(sender_account);

    call __t5 := BorrowField(__t4, LibraAccount_T_delegated_withdrawal_capability);

    call __tmp := ReadRef(__t5);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __tmp := GetLocal(__m, __frame + 6);
    if (!b#Boolean(__tmp)) { goto Label_9; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    goto Label_Abort;

Label_9:
    call __t8 := CopyOrMoveRef(sender_account);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := LibraAccount_withdraw_from_account(__t8, GetLocal(__m, __frame + 9));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t10);

    __m := UpdateLocal(__m, __frame + 10, __t10);

    __ret0 := GetLocal(__m, __frame + 10);
    debug#LibraAccount#withdraw_from_sender#2#__ret := debug#LibraAccount#withdraw_from_sender#2#__ret[Position(7024) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#withdraw_from_sender#2#__ret := debug#LibraAccount#withdraw_from_sender#2#__ret[Position(7109) := __ret0];
}

procedure LibraAccount_withdraw_from_sender_verify (amount: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_withdraw_from_sender(amount);
}

procedure {:inline 1} LibraAccount_withdraw_with_capability (cap: Reference, amount: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Reference; // ReferenceType(LibraAccount_WithdrawalCapability_type_value())
    var __t4: Reference; // ReferenceType(AddressType())
    var __t5: Value; // AddressType()
    var __t6: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t7: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t8: Value; // IntegerType()
    var __t9: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#withdraw_with_capability#0#cap: [Position]Value;
    var debug#LibraAccount#withdraw_with_capability#1#amount: [Position]Value;
    var debug#LibraAccount#withdraw_with_capability#2#account: [Position]Value;
    var debug#LibraAccount#withdraw_with_capability#3#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 10;
    debug#LibraAccount#withdraw_with_capability#0#cap := EmptyPositionMap;
    debug#LibraAccount#withdraw_with_capability#1#amount := EmptyPositionMap;
    debug#LibraAccount#withdraw_with_capability#2#account := EmptyPositionMap;
    debug#LibraAccount#withdraw_with_capability#3#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, cap));
    assume IsValidReferenceParameter(__m, __frame, cap);
    debug#LibraAccount#withdraw_with_capability#0#cap := debug#LibraAccount#withdraw_with_capability#0#cap[Position(7192) := Dereference(__m, cap)];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraAccount#withdraw_with_capability#1#amount := debug#LibraAccount#withdraw_with_capability#1#amount[Position(7192) := amount];

    // bytecode translation starts here
    call __t3 := CopyOrMoveRef(cap);

    call __t4 := BorrowField(__t3, LibraAccount_WithdrawalCapability_account_address);

    call __tmp := ReadRef(__t4);
    assume is#Address(__tmp);
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __t6 := BorrowGlobal(GetLocal(__m, __frame + 5), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call account := CopyOrMoveRef(__t6);

    call __t7 := CopyOrMoveRef(account);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __t9 := LibraAccount_withdraw_from_account(__t7, GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t9);

    __m := UpdateLocal(__m, __frame + 9, __t9);

    __ret0 := GetLocal(__m, __frame + 9);
    debug#LibraAccount#withdraw_with_capability#3#__ret := debug#LibraAccount#withdraw_with_capability#3#__ret[Position(7423) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#withdraw_with_capability#3#__ret := debug#LibraAccount#withdraw_with_capability#3#__ret[Position(7491) := __ret0];
}

procedure LibraAccount_withdraw_with_capability_verify (cap: Reference, amount: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_withdraw_with_capability(cap, amount);
}

procedure {:inline 1} LibraAccount_extract_sender_withdrawal_capability () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender: Value; // AddressType()
    var sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var delegated_ref: Reference; // ReferenceType(BooleanType())
    var __t3: Value; // AddressType()
    var __t4: Value; // AddressType()
    var __t5: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t6: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t7: Reference; // ReferenceType(BooleanType())
    var __t8: Reference; // ReferenceType(BooleanType())
    var __t9: Value; // BooleanType()
    var __t10: Value; // IntegerType()
    var __t11: Value; // BooleanType()
    var __t12: Reference; // ReferenceType(BooleanType())
    var __t13: Value; // AddressType()
    var __t14: Value; // LibraAccount_WithdrawalCapability_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#extract_sender_withdrawal_capability#0#sender: [Position]Value;
    var debug#LibraAccount#extract_sender_withdrawal_capability#1#sender_account: [Position]Value;
    var debug#LibraAccount#extract_sender_withdrawal_capability#2#delegated_ref: [Position]Value;
    var debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 15;
    debug#LibraAccount#extract_sender_withdrawal_capability#0#sender := EmptyPositionMap;
    debug#LibraAccount#extract_sender_withdrawal_capability#1#sender_account := EmptyPositionMap;
    debug#LibraAccount#extract_sender_withdrawal_capability#2#delegated_ref := EmptyPositionMap;
    debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 0, __tmp);
    debug#LibraAccount#extract_sender_withdrawal_capability#0#sender := debug#LibraAccount#extract_sender_withdrawal_capability#0#sender[Position(7802) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := BorrowGlobal(GetLocal(__m, __frame + 4), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account := CopyOrMoveRef(__t5);

    call __t6 := CopyOrMoveRef(sender_account);

    call __t7 := BorrowField(__t6, LibraAccount_T_delegated_withdrawal_capability);

    call delegated_ref := CopyOrMoveRef(__t7);

    call __t8 := CopyOrMoveRef(delegated_ref);

    call __tmp := ReadRef(__t8);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    __tmp := GetLocal(__m, __frame + 9);
    if (!b#Boolean(__tmp)) { goto Label_13; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    goto Label_Abort;

Label_13:
    call __tmp := LdTrue();
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __t12 := CopyOrMoveRef(delegated_ref);

    call WriteRef(__t12, GetLocal(__m, __frame + 11));

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __tmp := Pack_LibraAccount_WithdrawalCapability(GetLocal(__m, __frame + 13));
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    __ret0 := GetLocal(__m, __frame + 14);
    debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret := debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret[Position(8228) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret := debug#LibraAccount#extract_sender_withdrawal_capability#3#__ret[Position(8305) := __ret0];
}

procedure LibraAccount_extract_sender_withdrawal_capability_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_extract_sender_withdrawal_capability();
}

procedure {:inline 1} LibraAccount_restore_withdrawal_capability (cap: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var account_address: Value; // AddressType()
    var account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Value; // LibraAccount_WithdrawalCapability_type_value()
    var __t4: Value; // AddressType()
    var __t5: Value; // AddressType()
    var __t6: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t7: Value; // BooleanType()
    var __t8: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t9: Reference; // ReferenceType(BooleanType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#restore_withdrawal_capability#0#cap: [Position]Value;
    var debug#LibraAccount#restore_withdrawal_capability#1#account_address: [Position]Value;
    var debug#LibraAccount#restore_withdrawal_capability#2#account: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 10;
    debug#LibraAccount#restore_withdrawal_capability#0#cap := EmptyPositionMap;
    debug#LibraAccount#restore_withdrawal_capability#1#account_address := EmptyPositionMap;
    debug#LibraAccount#restore_withdrawal_capability#2#account := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(cap);
    __m := UpdateLocal(__m, __frame + 0, cap);
    debug#LibraAccount#restore_withdrawal_capability#0#cap := debug#LibraAccount#restore_withdrawal_capability#0#cap[Position(8391) := cap];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __t4 := Unpack_LibraAccount_WithdrawalCapability(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __t4);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraAccount#restore_withdrawal_capability#1#account_address := debug#LibraAccount#restore_withdrawal_capability#1#account_address[Position(8611) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __t6 := BorrowGlobal(GetLocal(__m, __frame + 5), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call account := CopyOrMoveRef(__t6);

    call __tmp := LdFalse();
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __t8 := CopyOrMoveRef(account);

    call __t9 := BorrowField(__t8, LibraAccount_T_delegated_withdrawal_capability);

    call WriteRef(__t9, GetLocal(__m, __frame + 7));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_restore_withdrawal_capability_verify (cap: Value) returns ()
{
    call InitVerification();
    call LibraAccount_restore_withdrawal_capability(cap);
}

procedure {:inline 1} LibraAccount_pay_from_capability (payee: Value, cap: Reference, amount: Value, metadata: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t4: Value; // AddressType()
    var __t5: Value; // BooleanType()
    var __t6: Value; // BooleanType()
    var __t7: Value; // AddressType()
    var __t8: Value; // AddressType()
    var __t9: Reference; // ReferenceType(LibraAccount_WithdrawalCapability_type_value())
    var __t10: Reference; // ReferenceType(AddressType())
    var __t11: Value; // AddressType()
    var __t12: Reference; // ReferenceType(LibraAccount_WithdrawalCapability_type_value())
    var __t13: Value; // IntegerType()
    var __t14: Value; // LibraCoin_T_type_value()
    var __t15: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#pay_from_capability#0#payee: [Position]Value;
    var debug#LibraAccount#pay_from_capability#1#cap: [Position]Value;
    var debug#LibraAccount#pay_from_capability#2#amount: [Position]Value;
    var debug#LibraAccount#pay_from_capability#3#metadata: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 16;
    debug#LibraAccount#pay_from_capability#0#payee := EmptyPositionMap;
    debug#LibraAccount#pay_from_capability#1#cap := EmptyPositionMap;
    debug#LibraAccount#pay_from_capability#2#amount := EmptyPositionMap;
    debug#LibraAccount#pay_from_capability#3#metadata := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#pay_from_capability#0#payee := debug#LibraAccount#pay_from_capability#0#payee[Position(9236) := payee];
    assume is#Vector(Dereference(__m, cap));
    assume IsValidReferenceParameter(__m, __frame, cap);
    debug#LibraAccount#pay_from_capability#1#cap := debug#LibraAccount#pay_from_capability#1#cap[Position(9236) := Dereference(__m, cap)];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 2, amount);
    debug#LibraAccount#pay_from_capability#2#amount := debug#LibraAccount#pay_from_capability#2#amount[Position(9236) := amount];
    assume is#ByteArray(metadata);
    __m := UpdateLocal(__m, __frame + 3, metadata);
    debug#LibraAccount#pay_from_capability#3#metadata := debug#LibraAccount#pay_from_capability#3#metadata[Position(9236) := metadata];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 4), LibraAccount_T_type_value());
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __tmp := GetLocal(__m, __frame + 6);
    if (!b#Boolean(__tmp)) { goto Label_6; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call LibraAccount_create_account(GetLocal(__m, __frame + 7));
    if (__abort_flag) { goto Label_Abort; }

Label_6:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __t9 := CopyOrMoveRef(cap);

    call __t10 := BorrowField(__t9, LibraAccount_WithdrawalCapability_account_address);

    call __tmp := ReadRef(__t10);
    assume is#Address(__tmp);
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __t12 := CopyOrMoveRef(cap);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __t14 := LibraAccount_withdraw_with_capability(__t12, GetLocal(__m, __frame + 13));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t14);

    __m := UpdateLocal(__m, __frame + 14, __t14);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call LibraAccount_deposit_with_sender_and_metadata(GetLocal(__m, __frame + 8), GetLocal(__m, __frame + 11), GetLocal(__m, __frame + 14), GetLocal(__m, __frame + 15));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_pay_from_capability_verify (payee: Value, cap: Reference, amount: Value, metadata: Value) returns ()
{
    call InitVerification();
    call LibraAccount_pay_from_capability(payee, cap, amount, metadata);
}

procedure {:inline 1} LibraAccount_pay_from_sender_with_metadata (payee: Value, amount: Value, metadata: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t3: Value; // AddressType()
    var __t4: Value; // BooleanType()
    var __t5: Value; // BooleanType()
    var __t6: Value; // AddressType()
    var __t7: Value; // AddressType()
    var __t8: Value; // IntegerType()
    var __t9: Value; // LibraCoin_T_type_value()
    var __t10: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#pay_from_sender_with_metadata#0#payee: [Position]Value;
    var debug#LibraAccount#pay_from_sender_with_metadata#1#amount: [Position]Value;
    var debug#LibraAccount#pay_from_sender_with_metadata#2#metadata: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 11;
    debug#LibraAccount#pay_from_sender_with_metadata#0#payee := EmptyPositionMap;
    debug#LibraAccount#pay_from_sender_with_metadata#1#amount := EmptyPositionMap;
    debug#LibraAccount#pay_from_sender_with_metadata#2#metadata := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#pay_from_sender_with_metadata#0#payee := debug#LibraAccount#pay_from_sender_with_metadata#0#payee[Position(9947) := payee];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraAccount#pay_from_sender_with_metadata#1#amount := debug#LibraAccount#pay_from_sender_with_metadata#1#amount[Position(9947) := amount];
    assume is#ByteArray(metadata);
    __m := UpdateLocal(__m, __frame + 2, metadata);
    debug#LibraAccount#pay_from_sender_with_metadata#2#metadata := debug#LibraAccount#pay_from_sender_with_metadata#2#metadata[Position(9947) := metadata];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 3), LibraAccount_T_type_value());
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    __tmp := GetLocal(__m, __frame + 5);
    if (!b#Boolean(__tmp)) { goto Label_6; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call LibraAccount_create_account(GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }

Label_6:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __t9 := LibraAccount_withdraw_from_sender(GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t9);

    __m := UpdateLocal(__m, __frame + 9, __t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 10, __tmp);

    call LibraAccount_deposit_with_metadata(GetLocal(__m, __frame + 7), GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 10));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_pay_from_sender_with_metadata_verify (payee: Value, amount: Value, metadata: Value) returns ()
{
    call InitVerification();
    call LibraAccount_pay_from_sender_with_metadata(payee, amount, metadata);
}

procedure {:inline 1} LibraAccount_pay_from_sender (payee: Value, amount: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // AddressType()
    var __t3: Value; // IntegerType()
    var __t4: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#pay_from_sender#0#payee: [Position]Value;
    var debug#LibraAccount#pay_from_sender#1#amount: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraAccount#pay_from_sender#0#payee := EmptyPositionMap;
    debug#LibraAccount#pay_from_sender#1#amount := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(payee);
    __m := UpdateLocal(__m, __frame + 0, payee);
    debug#LibraAccount#pay_from_sender#0#payee := debug#LibraAccount#pay_from_sender#0#payee[Position(10530) := payee];
    assume IsValidU64(amount);
    __m := UpdateLocal(__m, __frame + 1, amount);
    debug#LibraAccount#pay_from_sender#1#amount := debug#LibraAccount#pay_from_sender#1#amount[Position(10530) := amount];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    // unimplemented instruction: LdByteArray(4, ByteArrayPoolIndex(0))

    call LibraAccount_pay_from_sender_with_metadata(GetLocal(__m, __frame + 2), GetLocal(__m, __frame + 3), GetLocal(__m, __frame + 4));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_pay_from_sender_verify (payee: Value, amount: Value) returns ()
{
    call InitVerification();
    call LibraAccount_pay_from_sender(payee, amount);
}

procedure {:inline 1} LibraAccount_rotate_authentication_key_for_account (account: Reference, new_authentication_key: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // ByteArrayType()
    var __t3: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t4: Reference; // ReferenceType(ByteArrayType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#rotate_authentication_key_for_account#0#account: [Position]Value;
    var debug#LibraAccount#rotate_authentication_key_for_account#1#new_authentication_key: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraAccount#rotate_authentication_key_for_account#0#account := EmptyPositionMap;
    debug#LibraAccount#rotate_authentication_key_for_account#1#new_authentication_key := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, account));
    assume IsValidReferenceParameter(__m, __frame, account);
    debug#LibraAccount#rotate_authentication_key_for_account#0#account := debug#LibraAccount#rotate_authentication_key_for_account#0#account[Position(10698) := Dereference(__m, account)];
    assume is#ByteArray(new_authentication_key);
    __m := UpdateLocal(__m, __frame + 1, new_authentication_key);
    debug#LibraAccount#rotate_authentication_key_for_account#1#new_authentication_key := debug#LibraAccount#rotate_authentication_key_for_account#1#new_authentication_key[Position(10698) := new_authentication_key];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := CopyOrMoveRef(account);

    call __t4 := BorrowField(__t3, LibraAccount_T_authentication_key);

    call WriteRef(__t4, GetLocal(__m, __frame + 2));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_rotate_authentication_key_for_account_verify (account: Reference, new_authentication_key: Value) returns ()
{
    call InitVerification();
    call LibraAccount_rotate_authentication_key_for_account(account, new_authentication_key);
}

procedure {:inline 1} LibraAccount_rotate_authentication_key (new_authentication_key: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t4: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t5: Reference; // ReferenceType(BooleanType())
    var __t6: Value; // BooleanType()
    var __t7: Value; // IntegerType()
    var __t8: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t9: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#rotate_authentication_key#0#new_authentication_key: [Position]Value;
    var debug#LibraAccount#rotate_authentication_key#1#sender_account: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 10;
    debug#LibraAccount#rotate_authentication_key#0#new_authentication_key := EmptyPositionMap;
    debug#LibraAccount#rotate_authentication_key#1#sender_account := EmptyPositionMap;

    // process and type check arguments
    assume is#ByteArray(new_authentication_key);
    __m := UpdateLocal(__m, __frame + 0, new_authentication_key);
    debug#LibraAccount#rotate_authentication_key#0#new_authentication_key := debug#LibraAccount#rotate_authentication_key#0#new_authentication_key[Position(11025) := new_authentication_key];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(sender_account);

    call __t5 := BorrowField(__t4, LibraAccount_T_delegated_key_rotation_capability);

    call __tmp := ReadRef(__t5);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __tmp := GetLocal(__m, __frame + 6);
    if (!b#Boolean(__tmp)) { goto Label_9; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    goto Label_Abort;

Label_9:
    call __t8 := CopyOrMoveRef(sender_account);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call LibraAccount_rotate_authentication_key_for_account(__t8, GetLocal(__m, __frame + 9));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_rotate_authentication_key_verify (new_authentication_key: Value) returns ()
{
    call InitVerification();
    call LibraAccount_rotate_authentication_key(new_authentication_key);
}

procedure {:inline 1} LibraAccount_rotate_authentication_key_with_capability (cap: Reference, new_authentication_key: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Reference; // ReferenceType(LibraAccount_KeyRotationCapability_type_value())
    var __t3: Reference; // ReferenceType(AddressType())
    var __t4: Value; // AddressType()
    var __t5: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t6: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#rotate_authentication_key_with_capability#0#cap: [Position]Value;
    var debug#LibraAccount#rotate_authentication_key_with_capability#1#new_authentication_key: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 7;
    debug#LibraAccount#rotate_authentication_key_with_capability#0#cap := EmptyPositionMap;
    debug#LibraAccount#rotate_authentication_key_with_capability#1#new_authentication_key := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, cap));
    assume IsValidReferenceParameter(__m, __frame, cap);
    debug#LibraAccount#rotate_authentication_key_with_capability#0#cap := debug#LibraAccount#rotate_authentication_key_with_capability#0#cap[Position(11765) := Dereference(__m, cap)];
    assume is#ByteArray(new_authentication_key);
    __m := UpdateLocal(__m, __frame + 1, new_authentication_key);
    debug#LibraAccount#rotate_authentication_key_with_capability#1#new_authentication_key := debug#LibraAccount#rotate_authentication_key_with_capability#1#new_authentication_key[Position(11765) := new_authentication_key];

    // bytecode translation starts here
    call __t2 := CopyOrMoveRef(cap);

    call __t3 := BorrowField(__t2, LibraAccount_KeyRotationCapability_account_address);

    call __tmp := ReadRef(__t3);
    assume is#Address(__tmp);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := BorrowGlobal(GetLocal(__m, __frame + 4), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call LibraAccount_rotate_authentication_key_for_account(__t5, GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_rotate_authentication_key_with_capability_verify (cap: Reference, new_authentication_key: Value) returns ()
{
    call InitVerification();
    call LibraAccount_rotate_authentication_key_with_capability(cap, new_authentication_key);
}

procedure {:inline 1} LibraAccount_extract_sender_key_rotation_capability () returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender: Value; // AddressType()
    var delegated_ref: Reference; // ReferenceType(BooleanType())
    var __t2: Value; // AddressType()
    var __t3: Value; // AddressType()
    var __t4: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t5: Reference; // ReferenceType(BooleanType())
    var __t6: Reference; // ReferenceType(BooleanType())
    var __t7: Value; // BooleanType()
    var __t8: Value; // IntegerType()
    var __t9: Value; // BooleanType()
    var __t10: Reference; // ReferenceType(BooleanType())
    var __t11: Value; // AddressType()
    var __t12: Value; // LibraAccount_KeyRotationCapability_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#extract_sender_key_rotation_capability#0#sender: [Position]Value;
    var debug#LibraAccount#extract_sender_key_rotation_capability#1#delegated_ref: [Position]Value;
    var debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 13;
    debug#LibraAccount#extract_sender_key_rotation_capability#0#sender := EmptyPositionMap;
    debug#LibraAccount#extract_sender_key_rotation_capability#1#delegated_ref := EmptyPositionMap;
    debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 0, __tmp);
    debug#LibraAccount#extract_sender_key_rotation_capability#0#sender := debug#LibraAccount#extract_sender_key_rotation_capability#0#sender[Position(12375) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __t4 := BorrowGlobal(GetLocal(__m, __frame + 3), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t5 := BorrowField(__t4, LibraAccount_T_delegated_key_rotation_capability);

    call delegated_ref := CopyOrMoveRef(__t5);

    call __t6 := CopyOrMoveRef(delegated_ref);

    call __tmp := ReadRef(__t6);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    __tmp := GetLocal(__m, __frame + 7);
    if (!b#Boolean(__tmp)) { goto Label_11; }

    call __tmp := LdConst(11);
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    goto Label_Abort;

Label_11:
    call __tmp := LdTrue();
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := CopyOrMoveRef(delegated_ref);

    call WriteRef(__t10, GetLocal(__m, __frame + 9));

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := Pack_LibraAccount_KeyRotationCapability(GetLocal(__m, __frame + 11));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    __ret0 := GetLocal(__m, __frame + 12);
    debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret := debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret[Position(12758) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret := debug#LibraAccount#extract_sender_key_rotation_capability#2#__ret[Position(12836) := __ret0];
}

procedure LibraAccount_extract_sender_key_rotation_capability_verify () returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_extract_sender_key_rotation_capability();
}

procedure {:inline 1} LibraAccount_restore_key_rotation_capability (cap: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var account_address: Value; // AddressType()
    var account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Value; // LibraAccount_KeyRotationCapability_type_value()
    var __t4: Value; // AddressType()
    var __t5: Value; // AddressType()
    var __t6: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t7: Value; // BooleanType()
    var __t8: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t9: Reference; // ReferenceType(BooleanType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#restore_key_rotation_capability#0#cap: [Position]Value;
    var debug#LibraAccount#restore_key_rotation_capability#1#account_address: [Position]Value;
    var debug#LibraAccount#restore_key_rotation_capability#2#account: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 10;
    debug#LibraAccount#restore_key_rotation_capability#0#cap := EmptyPositionMap;
    debug#LibraAccount#restore_key_rotation_capability#1#account_address := EmptyPositionMap;
    debug#LibraAccount#restore_key_rotation_capability#2#account := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(cap);
    __m := UpdateLocal(__m, __frame + 0, cap);
    debug#LibraAccount#restore_key_rotation_capability#0#cap := debug#LibraAccount#restore_key_rotation_capability#0#cap[Position(12924) := cap];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __t4 := Unpack_LibraAccount_KeyRotationCapability(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __t4);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraAccount#restore_key_rotation_capability#1#account_address := debug#LibraAccount#restore_key_rotation_capability#1#account_address[Position(13148) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __t6 := BorrowGlobal(GetLocal(__m, __frame + 5), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call account := CopyOrMoveRef(__t6);

    call __tmp := LdFalse();
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call __t8 := CopyOrMoveRef(account);

    call __t9 := BorrowField(__t8, LibraAccount_T_delegated_key_rotation_capability);

    call WriteRef(__t9, GetLocal(__m, __frame + 7));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_restore_key_rotation_capability_verify (cap: Value) returns ()
{
    call InitVerification();
    call LibraAccount_restore_key_rotation_capability(cap);
}

procedure {:inline 1} LibraAccount_create_account (fresh_address: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var generator: Value; // LibraAccount_EventHandleGenerator_type_value()
    var __t2: Value; // IntegerType()
    var __t3: Value; // LibraAccount_EventHandleGenerator_type_value()
    var __t4: Value; // AddressType()
    var __t5: Value; // AddressType()
    var __t6: Value; // ByteArrayType()
    var __t7: Value; // LibraCoin_T_type_value()
    var __t8: Value; // BooleanType()
    var __t9: Value; // BooleanType()
    var __t10: Reference; // ReferenceType(LibraAccount_EventHandleGenerator_type_value())
    var __t11: Value; // AddressType()
    var __t12: Value; // LibraAccount_EventHandle_type_value(LibraAccount_ReceivedPaymentEvent_type_value())
    var __t13: Reference; // ReferenceType(LibraAccount_EventHandleGenerator_type_value())
    var __t14: Value; // AddressType()
    var __t15: Value; // LibraAccount_EventHandle_type_value(LibraAccount_SentPaymentEvent_type_value())
    var __t16: Value; // IntegerType()
    var __t17: Value; // LibraAccount_EventHandleGenerator_type_value()
    var __t18: Value; // LibraAccount_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#create_account#0#fresh_address: [Position]Value;
    var debug#LibraAccount#create_account#1#generator: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 19;
    debug#LibraAccount#create_account#0#fresh_address := EmptyPositionMap;
    debug#LibraAccount#create_account#1#generator := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(fresh_address);
    __m := UpdateLocal(__m, __frame + 0, fresh_address);
    debug#LibraAccount#create_account#0#fresh_address := debug#LibraAccount#create_account#0#fresh_address[Position(13761) := fresh_address];

    // bytecode translation starts here
    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __tmp := Pack_LibraAccount_EventHandleGenerator(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraAccount#create_account#1#generator := debug#LibraAccount#create_account#1#generator[Position(13868) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    call __t6 := AddressUtil_address_to_bytes(GetLocal(__m, __frame + 5));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t6);

    __m := UpdateLocal(__m, __frame + 6, __t6);

    call __t7 := LibraCoin_zero();
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t7);

    __m := UpdateLocal(__m, __frame + 7, __t7);

    call __tmp := LdFalse();
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __tmp := LdFalse();
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := BorrowLoc(__frame + 1);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __t12 := LibraAccount_new_event_handle_impl(LibraAccount_ReceivedPaymentEvent_type_value(), __t10, GetLocal(__m, __frame + 11));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t12);

    __m := UpdateLocal(__m, __frame + 12, __t12);
    debug#LibraAccount#create_account#1#generator := debug#LibraAccount#create_account#1#generator[Position(14268) := GetLocal(__m, __frame + 1)];

    call __t13 := BorrowLoc(__frame + 1);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __t15 := LibraAccount_new_event_handle_impl(LibraAccount_SentPaymentEvent_type_value(), __t13, GetLocal(__m, __frame + 14));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t15);

    __m := UpdateLocal(__m, __frame + 15, __t15);
    debug#LibraAccount#create_account#1#generator := debug#LibraAccount#create_account#1#generator[Position(14389) := GetLocal(__m, __frame + 1)];

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 17, __tmp);

    call __tmp := Pack_LibraAccount_T(GetLocal(__m, __frame + 6), GetLocal(__m, __frame + 7), GetLocal(__m, __frame + 8), GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 12), GetLocal(__m, __frame + 15), GetLocal(__m, __frame + 16), GetLocal(__m, __frame + 17));
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call LibraAccount_save_account(GetLocal(__m, __frame + 4), GetLocal(__m, __frame + 18));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_create_account_verify (fresh_address: Value) returns ()
{
    call InitVerification();
    call LibraAccount_create_account(fresh_address);
}

procedure {:inline 1} LibraAccount_create_new_account (fresh_address: Value, initial_balance: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // AddressType()
    var __t3: Value; // IntegerType()
    var __t4: Value; // IntegerType()
    var __t5: Value; // BooleanType()
    var __t6: Value; // AddressType()
    var __t7: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#create_new_account#0#fresh_address: [Position]Value;
    var debug#LibraAccount#create_new_account#1#initial_balance: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#LibraAccount#create_new_account#0#fresh_address := EmptyPositionMap;
    debug#LibraAccount#create_new_account#1#initial_balance := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(fresh_address);
    __m := UpdateLocal(__m, __frame + 0, fresh_address);
    debug#LibraAccount#create_new_account#0#fresh_address := debug#LibraAccount#create_new_account#0#fresh_address[Position(14744) := fresh_address];
    assume IsValidU64(initial_balance);
    __m := UpdateLocal(__m, __frame + 1, initial_balance);
    debug#LibraAccount#create_new_account#1#initial_balance := debug#LibraAccount#create_new_account#1#initial_balance[Position(14744) := initial_balance];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call LibraAccount_create_account(GetLocal(__m, __frame + 2));
    if (__abort_flag) { goto Label_Abort; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __tmp := Gt(GetLocal(__m, __frame + 3), GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    __tmp := GetLocal(__m, __frame + 5);
    if (!b#Boolean(__tmp)) { goto Label_9; }

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 7, __tmp);

    call LibraAccount_pay_from_sender(GetLocal(__m, __frame + 6), GetLocal(__m, __frame + 7));
    if (__abort_flag) { goto Label_Abort; }

Label_9:
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_create_new_account_verify (fresh_address: Value, initial_balance: Value) returns ()
{
    call InitVerification();
    call LibraAccount_create_new_account(fresh_address, initial_balance);
}

procedure {:inline 1} LibraAccount_save_account (addr: Value, account: Value) returns ();
requires ExistsTxnSenderAccount(__m, __txn);

procedure {:inline 1} LibraAccount_balance_for_account (account: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var balance_value: Value; // IntegerType()
    var __t2: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t4: Value; // IntegerType()
    var __t5: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#balance_for_account#0#account: [Position]Value;
    var debug#LibraAccount#balance_for_account#1#balance_value: [Position]Value;
    var debug#LibraAccount#balance_for_account#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 6;
    debug#LibraAccount#balance_for_account#0#account := EmptyPositionMap;
    debug#LibraAccount#balance_for_account#1#balance_value := EmptyPositionMap;
    debug#LibraAccount#balance_for_account#2#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, account));
    assume IsValidReferenceParameter(__m, __frame, account);
    debug#LibraAccount#balance_for_account#0#account := debug#LibraAccount#balance_for_account#0#account[Position(15265) := Dereference(__m, account)];

    // bytecode translation starts here
    call __t2 := CopyOrMoveRef(account);

    call __t3 := BorrowField(__t2, LibraAccount_T_balance);

    call __t4 := LibraCoin_value(__t3);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t4);

    __m := UpdateLocal(__m, __frame + 4, __t4);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraAccount#balance_for_account#1#balance_value := debug#LibraAccount#balance_for_account#1#balance_value[Position(15350) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 5, __tmp);

    __ret0 := GetLocal(__m, __frame + 5);
    debug#LibraAccount#balance_for_account#2#__ret := debug#LibraAccount#balance_for_account#2#__ret[Position(15415) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#balance_for_account#2#__ret := debug#LibraAccount#balance_for_account#2#__ret[Position(15447) := __ret0];
}

procedure LibraAccount_balance_for_account_verify (account: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_balance_for_account(account);
}

procedure {:inline 1} LibraAccount_balance (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#balance#0#addr: [Position]Value;
    var debug#LibraAccount#balance#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraAccount#balance#0#addr := EmptyPositionMap;
    debug#LibraAccount#balance#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#LibraAccount#balance#0#addr := debug#LibraAccount#balance#0#addr[Position(15535) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __t2 := BorrowGlobal(GetLocal(__m, __frame + 1), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t3 := LibraAccount_balance_for_account(__t2);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t3);

    __m := UpdateLocal(__m, __frame + 3, __t3);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraAccount#balance#1#__ret := debug#LibraAccount#balance#1#__ret[Position(15591) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#balance#1#__ret := debug#LibraAccount#balance#1#__ret[Position(15658) := __ret0];
}

procedure LibraAccount_balance_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_balance(addr);
}

procedure {:inline 1} LibraAccount_sequence_number_for_account (account: Reference) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t2: Reference; // ReferenceType(IntegerType())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#sequence_number_for_account#0#account: [Position]Value;
    var debug#LibraAccount#sequence_number_for_account#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraAccount#sequence_number_for_account#0#account := EmptyPositionMap;
    debug#LibraAccount#sequence_number_for_account#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, account));
    assume IsValidReferenceParameter(__m, __frame, account);
    debug#LibraAccount#sequence_number_for_account#0#account := debug#LibraAccount#sequence_number_for_account#0#account[Position(15735) := Dereference(__m, account)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(account);

    call __t2 := BorrowField(__t1, LibraAccount_T_sequence_number);

    call __tmp := ReadRef(__t2);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraAccount#sequence_number_for_account#1#__ret := debug#LibraAccount#sequence_number_for_account#1#__ret[Position(15796) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#sequence_number_for_account#1#__ret := debug#LibraAccount#sequence_number_for_account#1#__ret[Position(15842) := __ret0];
}

procedure LibraAccount_sequence_number_for_account_verify (account: Reference) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_sequence_number_for_account(account);
}

procedure {:inline 1} LibraAccount_sequence_number (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#sequence_number#0#addr: [Position]Value;
    var debug#LibraAccount#sequence_number#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 4;
    debug#LibraAccount#sequence_number#0#addr := EmptyPositionMap;
    debug#LibraAccount#sequence_number#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#LibraAccount#sequence_number#0#addr := debug#LibraAccount#sequence_number#0#addr[Position(15901) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __t2 := BorrowGlobal(GetLocal(__m, __frame + 1), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t3 := LibraAccount_sequence_number_for_account(__t2);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t3);

    __m := UpdateLocal(__m, __frame + 3, __t3);

    __ret0 := GetLocal(__m, __frame + 3);
    debug#LibraAccount#sequence_number#1#__ret := debug#LibraAccount#sequence_number#1#__ret[Position(15965) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#sequence_number#1#__ret := debug#LibraAccount#sequence_number#1#__ret[Position(16040) := __ret0];
}

procedure LibraAccount_sequence_number_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_sequence_number(addr);
}

procedure {:inline 1} LibraAccount_delegated_key_rotation_capability (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Reference; // ReferenceType(BooleanType())
    var __t4: Value; // BooleanType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#delegated_key_rotation_capability#0#addr: [Position]Value;
    var debug#LibraAccount#delegated_key_rotation_capability#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraAccount#delegated_key_rotation_capability#0#addr := EmptyPositionMap;
    debug#LibraAccount#delegated_key_rotation_capability#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#LibraAccount#delegated_key_rotation_capability#0#addr := debug#LibraAccount#delegated_key_rotation_capability#0#addr[Position(16132) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __t2 := BorrowGlobal(GetLocal(__m, __frame + 1), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t3 := BorrowField(__t2, LibraAccount_T_delegated_key_rotation_capability);

    call __tmp := ReadRef(__t3);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __ret0 := GetLocal(__m, __frame + 4);
    debug#LibraAccount#delegated_key_rotation_capability#1#__ret := debug#LibraAccount#delegated_key_rotation_capability#1#__ret[Position(16215) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#delegated_key_rotation_capability#1#__ret := debug#LibraAccount#delegated_key_rotation_capability#1#__ret[Position(16294) := __ret0];
}

procedure LibraAccount_delegated_key_rotation_capability_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_delegated_key_rotation_capability(addr);
}

procedure {:inline 1} LibraAccount_delegated_withdrawal_capability (addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t3: Reference; // ReferenceType(BooleanType())
    var __t4: Value; // BooleanType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#delegated_withdrawal_capability#0#addr: [Position]Value;
    var debug#LibraAccount#delegated_withdrawal_capability#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 5;
    debug#LibraAccount#delegated_withdrawal_capability#0#addr := EmptyPositionMap;
    debug#LibraAccount#delegated_withdrawal_capability#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(addr);
    __m := UpdateLocal(__m, __frame + 0, addr);
    debug#LibraAccount#delegated_withdrawal_capability#0#addr := debug#LibraAccount#delegated_withdrawal_capability#0#addr[Position(16385) := addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __t2 := BorrowGlobal(GetLocal(__m, __frame + 1), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call __t3 := BorrowField(__t2, LibraAccount_T_delegated_withdrawal_capability);

    call __tmp := ReadRef(__t3);
    assume is#Boolean(__tmp);
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    __ret0 := GetLocal(__m, __frame + 4);
    debug#LibraAccount#delegated_withdrawal_capability#1#__ret := debug#LibraAccount#delegated_withdrawal_capability#1#__ret[Position(16466) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#delegated_withdrawal_capability#1#__ret := debug#LibraAccount#delegated_withdrawal_capability#1#__ret[Position(16543) := __ret0];
}

procedure LibraAccount_delegated_withdrawal_capability_verify (addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_delegated_withdrawal_capability(addr);
}

procedure {:inline 1} LibraAccount_withdrawal_capability_address (cap: Reference) returns (__ret0: Reference)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(LibraAccount_WithdrawalCapability_type_value())
    var __t2: Reference; // ReferenceType(AddressType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#withdrawal_capability_address#0#cap: [Position]Value;
    var debug#LibraAccount#withdrawal_capability_address#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 3;
    debug#LibraAccount#withdrawal_capability_address#0#cap := EmptyPositionMap;
    debug#LibraAccount#withdrawal_capability_address#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, cap));
    assume IsValidReferenceParameter(__m, __frame, cap);
    debug#LibraAccount#withdrawal_capability_address#0#cap := debug#LibraAccount#withdrawal_capability_address#0#cap[Position(16640) := Dereference(__m, cap)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(cap);

    call __t2 := BorrowField(__t1, LibraAccount_WithdrawalCapability_account_address);

    __ret0 := __t2;
    debug#LibraAccount#withdrawal_capability_address#1#__ret := debug#LibraAccount#withdrawal_capability_address#1#__ret[Position(16730) := Dereference(__m, __ret0)];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultReference;
    debug#LibraAccount#withdrawal_capability_address#1#__ret := debug#LibraAccount#withdrawal_capability_address#1#__ret[Position(16769) := Dereference(__m, __ret0)];
}

procedure LibraAccount_withdrawal_capability_address_verify (cap: Reference) returns (__ret0: Reference)
{
    call InitVerification();
    call __ret0 := LibraAccount_withdrawal_capability_address(cap);
}

procedure {:inline 1} LibraAccount_key_rotation_capability_address (cap: Reference) returns (__ret0: Reference)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Reference; // ReferenceType(LibraAccount_KeyRotationCapability_type_value())
    var __t2: Reference; // ReferenceType(AddressType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#key_rotation_capability_address#0#cap: [Position]Value;
    var debug#LibraAccount#key_rotation_capability_address#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 3;
    debug#LibraAccount#key_rotation_capability_address#0#cap := EmptyPositionMap;
    debug#LibraAccount#key_rotation_capability_address#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, cap));
    assume IsValidReferenceParameter(__m, __frame, cap);
    debug#LibraAccount#key_rotation_capability_address#0#cap := debug#LibraAccount#key_rotation_capability_address#0#cap[Position(16867) := Dereference(__m, cap)];

    // bytecode translation starts here
    call __t1 := CopyOrMoveRef(cap);

    call __t2 := BorrowField(__t1, LibraAccount_KeyRotationCapability_account_address);

    __ret0 := __t2;
    debug#LibraAccount#key_rotation_capability_address#1#__ret := debug#LibraAccount#key_rotation_capability_address#1#__ret[Position(16960) := Dereference(__m, __ret0)];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultReference;
    debug#LibraAccount#key_rotation_capability_address#1#__ret := debug#LibraAccount#key_rotation_capability_address#1#__ret[Position(16999) := Dereference(__m, __ret0)];
}

procedure LibraAccount_key_rotation_capability_address_verify (cap: Reference) returns (__ret0: Reference)
{
    call InitVerification();
    call __ret0 := LibraAccount_key_rotation_capability_address(cap);
}

procedure {:inline 1} LibraAccount_exists (check_addr: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t1: Value; // AddressType()
    var __t2: Value; // BooleanType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#exists#0#check_addr: [Position]Value;
    var debug#LibraAccount#exists#1#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 3;
    debug#LibraAccount#exists#0#check_addr := EmptyPositionMap;
    debug#LibraAccount#exists#1#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Address(check_addr);
    __m := UpdateLocal(__m, __frame + 0, check_addr);
    debug#LibraAccount#exists#0#check_addr := debug#LibraAccount#exists#0#check_addr[Position(17057) := check_addr];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 1, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 1), LibraAccount_T_type_value());
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    __ret0 := GetLocal(__m, __frame + 2);
    debug#LibraAccount#exists#1#__ret := debug#LibraAccount#exists#1#__ret[Position(17108) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#exists#1#__ret := debug#LibraAccount#exists#1#__ret[Position(17148) := __ret0];
}

procedure LibraAccount_exists_verify (check_addr: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_exists(check_addr);
}

procedure {:inline 1} LibraAccount_prologue (txn_sequence_number: Value, txn_public_key: Value, txn_gas_price: Value, txn_max_gas_units: Value, txn_expiration_time: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var transaction_sender: Value; // AddressType()
    var sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var imm_sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var max_transaction_fee: Value; // IntegerType()
    var balance_amount: Value; // IntegerType()
    var sequence_number_value: Value; // IntegerType()
    var __t11: Value; // AddressType()
    var __t12: Value; // AddressType()
    var __t13: Value; // BooleanType()
    var __t14: Value; // BooleanType()
    var __t15: Value; // IntegerType()
    var __t16: Value; // AddressType()
    var __t17: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t18: Value; // ByteArrayType()
    var __t19: Value; // ByteArrayType()
    var __t20: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t21: Reference; // ReferenceType(ByteArrayType())
    var __t22: Value; // ByteArrayType()
    var __t23: Value; // BooleanType()
    var __t24: Value; // BooleanType()
    var __t25: Value; // IntegerType()
    var __t26: Value; // IntegerType()
    var __t27: Value; // IntegerType()
    var __t28: Value; // IntegerType()
    var __t29: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t30: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t31: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t32: Value; // IntegerType()
    var __t33: Value; // IntegerType()
    var __t34: Value; // IntegerType()
    var __t35: Value; // BooleanType()
    var __t36: Value; // BooleanType()
    var __t37: Value; // IntegerType()
    var __t38: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t39: Reference; // ReferenceType(IntegerType())
    var __t40: Value; // IntegerType()
    var __t41: Value; // IntegerType()
    var __t42: Value; // IntegerType()
    var __t43: Value; // BooleanType()
    var __t44: Value; // BooleanType()
    var __t45: Value; // IntegerType()
    var __t46: Value; // IntegerType()
    var __t47: Value; // IntegerType()
    var __t48: Value; // BooleanType()
    var __t49: Value; // BooleanType()
    var __t50: Value; // IntegerType()
    var __t51: Value; // IntegerType()
    var __t52: Value; // BooleanType()
    var __t53: Value; // BooleanType()
    var __t54: Value; // IntegerType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#prologue#0#txn_sequence_number: [Position]Value;
    var debug#LibraAccount#prologue#1#txn_public_key: [Position]Value;
    var debug#LibraAccount#prologue#2#txn_gas_price: [Position]Value;
    var debug#LibraAccount#prologue#3#txn_max_gas_units: [Position]Value;
    var debug#LibraAccount#prologue#4#txn_expiration_time: [Position]Value;
    var debug#LibraAccount#prologue#5#transaction_sender: [Position]Value;
    var debug#LibraAccount#prologue#6#sender_account: [Position]Value;
    var debug#LibraAccount#prologue#7#imm_sender_account: [Position]Value;
    var debug#LibraAccount#prologue#8#max_transaction_fee: [Position]Value;
    var debug#LibraAccount#prologue#9#balance_amount: [Position]Value;
    var debug#LibraAccount#prologue#10#sequence_number_value: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 55;
    debug#LibraAccount#prologue#0#txn_sequence_number := EmptyPositionMap;
    debug#LibraAccount#prologue#1#txn_public_key := EmptyPositionMap;
    debug#LibraAccount#prologue#2#txn_gas_price := EmptyPositionMap;
    debug#LibraAccount#prologue#3#txn_max_gas_units := EmptyPositionMap;
    debug#LibraAccount#prologue#4#txn_expiration_time := EmptyPositionMap;
    debug#LibraAccount#prologue#5#transaction_sender := EmptyPositionMap;
    debug#LibraAccount#prologue#6#sender_account := EmptyPositionMap;
    debug#LibraAccount#prologue#7#imm_sender_account := EmptyPositionMap;
    debug#LibraAccount#prologue#8#max_transaction_fee := EmptyPositionMap;
    debug#LibraAccount#prologue#9#balance_amount := EmptyPositionMap;
    debug#LibraAccount#prologue#10#sequence_number_value := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(txn_sequence_number);
    __m := UpdateLocal(__m, __frame + 0, txn_sequence_number);
    debug#LibraAccount#prologue#0#txn_sequence_number := debug#LibraAccount#prologue#0#txn_sequence_number[Position(17457) := txn_sequence_number];
    assume is#ByteArray(txn_public_key);
    __m := UpdateLocal(__m, __frame + 1, txn_public_key);
    debug#LibraAccount#prologue#1#txn_public_key := debug#LibraAccount#prologue#1#txn_public_key[Position(17457) := txn_public_key];
    assume IsValidU64(txn_gas_price);
    __m := UpdateLocal(__m, __frame + 2, txn_gas_price);
    debug#LibraAccount#prologue#2#txn_gas_price := debug#LibraAccount#prologue#2#txn_gas_price[Position(17457) := txn_gas_price];
    assume IsValidU64(txn_max_gas_units);
    __m := UpdateLocal(__m, __frame + 3, txn_max_gas_units);
    debug#LibraAccount#prologue#3#txn_max_gas_units := debug#LibraAccount#prologue#3#txn_max_gas_units[Position(17457) := txn_max_gas_units];
    assume IsValidU64(txn_expiration_time);
    __m := UpdateLocal(__m, __frame + 4, txn_expiration_time);
    debug#LibraAccount#prologue#4#txn_expiration_time := debug#LibraAccount#prologue#4#txn_expiration_time[Position(17457) := txn_expiration_time];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 11));
    __m := UpdateLocal(__m, __frame + 5, __tmp);
    debug#LibraAccount#prologue#5#transaction_sender := debug#LibraAccount#prologue#5#transaction_sender[Position(17892) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call __tmp := Exists(GetLocal(__m, __frame + 12), LibraAccount_T_type_value());
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 13));
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    __tmp := GetLocal(__m, __frame + 14);
    if (!b#Boolean(__tmp)) { goto Label_8; }

    call __tmp := LdConst(5);
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    goto Label_Abort;

Label_8:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __t17 := BorrowGlobal(GetLocal(__m, __frame + 16), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account := CopyOrMoveRef(__t17);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call __t19 := Hash_sha3_256(GetLocal(__m, __frame + 18));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t19);

    __m := UpdateLocal(__m, __frame + 19, __t19);

    call __t20 := CopyOrMoveRef(sender_account);

    call __t21 := BorrowField(__t20, LibraAccount_T_authentication_key);

    call __tmp := ReadRef(__t21);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 22, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 19), GetLocal(__m, __frame + 22)));
    __m := UpdateLocal(__m, __frame + 23, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 23));
    __m := UpdateLocal(__m, __frame + 24, __tmp);

    __tmp := GetLocal(__m, __frame + 24);
    if (!b#Boolean(__tmp)) { goto Label_21; }

    call __tmp := LdConst(2);
    __m := UpdateLocal(__m, __frame + 25, __tmp);

    goto Label_Abort;

Label_21:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 26, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 27, __tmp);

    call __tmp := MulU64(GetLocal(__m, __frame + 26), GetLocal(__m, __frame + 27));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 28, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 28));
    __m := UpdateLocal(__m, __frame + 8, __tmp);
    debug#LibraAccount#prologue#8#max_transaction_fee := debug#LibraAccount#prologue#8#max_transaction_fee[Position(18540) := __tmp];

    call __t29 := CopyOrMoveRef(sender_account);

    call __t30 := FreezeRef(__t29);

    call imm_sender_account := CopyOrMoveRef(__t30);

    call __t31 := CopyOrMoveRef(imm_sender_account);

    call __t32 := LibraAccount_balance_for_account(__t31);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t32);

    __m := UpdateLocal(__m, __frame + 32, __t32);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 32));
    __m := UpdateLocal(__m, __frame + 9, __tmp);
    debug#LibraAccount#prologue#9#balance_amount := debug#LibraAccount#prologue#9#balance_amount[Position(18676) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 9));
    __m := UpdateLocal(__m, __frame + 33, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 8));
    __m := UpdateLocal(__m, __frame + 34, __tmp);

    call __tmp := Ge(GetLocal(__m, __frame + 33), GetLocal(__m, __frame + 34));
    __m := UpdateLocal(__m, __frame + 35, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 35));
    __m := UpdateLocal(__m, __frame + 36, __tmp);

    __tmp := GetLocal(__m, __frame + 36);
    if (!b#Boolean(__tmp)) { goto Label_38; }

    call __tmp := LdConst(6);
    __m := UpdateLocal(__m, __frame + 37, __tmp);

    goto Label_Abort;

Label_38:
    call __t38 := CopyOrMoveRef(sender_account);

    call __t39 := BorrowField(__t38, LibraAccount_T_sequence_number);

    call __tmp := ReadRef(__t39);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 40, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 40));
    __m := UpdateLocal(__m, __frame + 10, __tmp);
    debug#LibraAccount#prologue#10#sequence_number_value := debug#LibraAccount#prologue#10#sequence_number_value[Position(18921) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 41, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 10));
    __m := UpdateLocal(__m, __frame + 42, __tmp);

    call __tmp := Ge(GetLocal(__m, __frame + 41), GetLocal(__m, __frame + 42));
    __m := UpdateLocal(__m, __frame + 43, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 43));
    __m := UpdateLocal(__m, __frame + 44, __tmp);

    __tmp := GetLocal(__m, __frame + 44);
    if (!b#Boolean(__tmp)) { goto Label_49; }

    call __tmp := LdConst(3);
    __m := UpdateLocal(__m, __frame + 45, __tmp);

    goto Label_Abort;

Label_49:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 46, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 10));
    __m := UpdateLocal(__m, __frame + 47, __tmp);

    __tmp := Boolean(IsEqual(GetLocal(__m, __frame + 46), GetLocal(__m, __frame + 47)));
    __m := UpdateLocal(__m, __frame + 48, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 48));
    __m := UpdateLocal(__m, __frame + 49, __tmp);

    __tmp := GetLocal(__m, __frame + 49);
    if (!b#Boolean(__tmp)) { goto Label_56; }

    call __tmp := LdConst(4);
    __m := UpdateLocal(__m, __frame + 50, __tmp);

    goto Label_Abort;

Label_56:
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 51, __tmp);

    call __t52 := LibraTransactionTimeout_is_valid_transaction_timestamp(GetLocal(__m, __frame + 51));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Boolean(__t52);

    __m := UpdateLocal(__m, __frame + 52, __t52);

    call __tmp := Not(GetLocal(__m, __frame + 52));
    __m := UpdateLocal(__m, __frame + 53, __tmp);

    __tmp := GetLocal(__m, __frame + 53);
    if (!b#Boolean(__tmp)) { goto Label_62; }

    call __tmp := LdConst(7);
    __m := UpdateLocal(__m, __frame + 54, __tmp);

    goto Label_Abort;

Label_62:
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_prologue_verify (txn_sequence_number: Value, txn_public_key: Value, txn_gas_price: Value, txn_max_gas_units: Value, txn_expiration_time: Value) returns ()
{
    call InitVerification();
    call LibraAccount_prologue(txn_sequence_number, txn_public_key, txn_gas_price, txn_max_gas_units, txn_expiration_time);
}

procedure {:inline 1} LibraAccount_epilogue (txn_sequence_number: Value, txn_gas_price: Value, txn_max_gas_units: Value, gas_units_remaining: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var transaction_fee_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var imm_sender_account: Reference; // ReferenceType(LibraAccount_T_type_value())
    var transaction_fee_amount: Value; // IntegerType()
    var transaction_fee: Value; // LibraCoin_T_type_value()
    var __t9: Value; // AddressType()
    var __t10: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t11: Value; // IntegerType()
    var __t12: Value; // IntegerType()
    var __t13: Value; // IntegerType()
    var __t14: Value; // IntegerType()
    var __t15: Value; // IntegerType()
    var __t16: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t17: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t18: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t19: Value; // IntegerType()
    var __t20: Value; // IntegerType()
    var __t21: Value; // BooleanType()
    var __t22: Value; // BooleanType()
    var __t23: Value; // IntegerType()
    var __t24: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t25: Value; // IntegerType()
    var __t26: Value; // LibraCoin_T_type_value()
    var __t27: Value; // IntegerType()
    var __t28: Value; // IntegerType()
    var __t29: Value; // IntegerType()
    var __t30: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t31: Reference; // ReferenceType(IntegerType())
    var __t32: Value; // AddressType()
    var __t33: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t34: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t35: Reference; // ReferenceType(LibraCoin_T_type_value())
    var __t36: Value; // LibraCoin_T_type_value()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#epilogue#0#txn_sequence_number: [Position]Value;
    var debug#LibraAccount#epilogue#1#txn_gas_price: [Position]Value;
    var debug#LibraAccount#epilogue#2#txn_max_gas_units: [Position]Value;
    var debug#LibraAccount#epilogue#3#gas_units_remaining: [Position]Value;
    var debug#LibraAccount#epilogue#4#sender_account: [Position]Value;
    var debug#LibraAccount#epilogue#5#transaction_fee_account: [Position]Value;
    var debug#LibraAccount#epilogue#6#imm_sender_account: [Position]Value;
    var debug#LibraAccount#epilogue#7#transaction_fee_amount: [Position]Value;
    var debug#LibraAccount#epilogue#8#transaction_fee: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 37;
    debug#LibraAccount#epilogue#0#txn_sequence_number := EmptyPositionMap;
    debug#LibraAccount#epilogue#1#txn_gas_price := EmptyPositionMap;
    debug#LibraAccount#epilogue#2#txn_max_gas_units := EmptyPositionMap;
    debug#LibraAccount#epilogue#3#gas_units_remaining := EmptyPositionMap;
    debug#LibraAccount#epilogue#4#sender_account := EmptyPositionMap;
    debug#LibraAccount#epilogue#5#transaction_fee_account := EmptyPositionMap;
    debug#LibraAccount#epilogue#6#imm_sender_account := EmptyPositionMap;
    debug#LibraAccount#epilogue#7#transaction_fee_amount := EmptyPositionMap;
    debug#LibraAccount#epilogue#8#transaction_fee := EmptyPositionMap;

    // process and type check arguments
    assume IsValidU64(txn_sequence_number);
    __m := UpdateLocal(__m, __frame + 0, txn_sequence_number);
    debug#LibraAccount#epilogue#0#txn_sequence_number := debug#LibraAccount#epilogue#0#txn_sequence_number[Position(19386) := txn_sequence_number];
    assume IsValidU64(txn_gas_price);
    __m := UpdateLocal(__m, __frame + 1, txn_gas_price);
    debug#LibraAccount#epilogue#1#txn_gas_price := debug#LibraAccount#epilogue#1#txn_gas_price[Position(19386) := txn_gas_price];
    assume IsValidU64(txn_max_gas_units);
    __m := UpdateLocal(__m, __frame + 2, txn_max_gas_units);
    debug#LibraAccount#epilogue#2#txn_max_gas_units := debug#LibraAccount#epilogue#2#txn_max_gas_units[Position(19386) := txn_max_gas_units];
    assume IsValidU64(gas_units_remaining);
    __m := UpdateLocal(__m, __frame + 3, gas_units_remaining);
    debug#LibraAccount#epilogue#3#gas_units_remaining := debug#LibraAccount#epilogue#3#gas_units_remaining[Position(19386) := gas_units_remaining];

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := BorrowGlobal(GetLocal(__m, __frame + 9), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account := CopyOrMoveRef(__t10);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 2));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 13, __tmp);

    call __tmp := Sub(GetLocal(__m, __frame + 12), GetLocal(__m, __frame + 13));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __tmp := MulU64(GetLocal(__m, __frame + 11), GetLocal(__m, __frame + 14));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 15));
    __m := UpdateLocal(__m, __frame + 7, __tmp);
    debug#LibraAccount#epilogue#7#transaction_fee_amount := debug#LibraAccount#epilogue#7#transaction_fee_amount[Position(19907) := __tmp];

    call __t16 := CopyOrMoveRef(sender_account);

    call __t17 := FreezeRef(__t16);

    call imm_sender_account := CopyOrMoveRef(__t17);

    call __t18 := CopyOrMoveRef(imm_sender_account);

    call __t19 := LibraAccount_balance_for_account(__t18);
    if (__abort_flag) { goto Label_Abort; }
    assume IsValidU64(__t19);

    __m := UpdateLocal(__m, __frame + 19, __t19);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 20, __tmp);

    call __tmp := Ge(GetLocal(__m, __frame + 19), GetLocal(__m, __frame + 20));
    __m := UpdateLocal(__m, __frame + 21, __tmp);

    call __tmp := Not(GetLocal(__m, __frame + 21));
    __m := UpdateLocal(__m, __frame + 22, __tmp);

    __tmp := GetLocal(__m, __frame + 22);
    if (!b#Boolean(__tmp)) { goto Label_20; }

    call __tmp := LdConst(6);
    __m := UpdateLocal(__m, __frame + 23, __tmp);

    goto Label_Abort;

Label_20:
    call __t24 := CopyOrMoveRef(sender_account);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 7));
    __m := UpdateLocal(__m, __frame + 25, __tmp);

    call __t26 := LibraAccount_withdraw_from_account(__t24, GetLocal(__m, __frame + 25));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t26);

    __m := UpdateLocal(__m, __frame + 26, __t26);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 26));
    __m := UpdateLocal(__m, __frame + 8, __tmp);
    debug#LibraAccount#epilogue#8#transaction_fee := debug#LibraAccount#epilogue#8#transaction_fee[Position(20225) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 27, __tmp);

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 28, __tmp);

    call __tmp := AddU64(GetLocal(__m, __frame + 27), GetLocal(__m, __frame + 28));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 29, __tmp);

    call __t30 := CopyOrMoveRef(sender_account);

    call __t31 := BorrowField(__t30, LibraAccount_T_sequence_number);

    call WriteRef(__t31, GetLocal(__m, __frame + 29));

    call __tmp := LdAddr(4078);
    __m := UpdateLocal(__m, __frame + 32, __tmp);

    call __t33 := BorrowGlobal(GetLocal(__m, __frame + 32), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call transaction_fee_account := CopyOrMoveRef(__t33);

    call __t34 := CopyOrMoveRef(transaction_fee_account);

    call __t35 := BorrowField(__t34, LibraAccount_T_balance);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 8));
    __m := UpdateLocal(__m, __frame + 36, __tmp);

    call LibraCoin_deposit(__t35, GetLocal(__m, __frame + 36));
    if (__abort_flag) { goto Label_Abort; }

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_epilogue_verify (txn_sequence_number: Value, txn_gas_price: Value, txn_max_gas_units: Value, gas_units_remaining: Value) returns ()
{
    call InitVerification();
    call LibraAccount_epilogue(txn_sequence_number, txn_gas_price, txn_max_gas_units, gas_units_remaining);
}

procedure {:inline 1} LibraAccount_fresh_guid (counter: Reference, sender: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var count: Reference; // ReferenceType(IntegerType())
    var count_bytes: Value; // ByteArrayType()
    var preimage: Value; // ByteArrayType()
    var sender_bytes: Value; // ByteArrayType()
    var __t6: Reference; // ReferenceType(LibraAccount_EventHandleGenerator_type_value())
    var __t7: Reference; // ReferenceType(IntegerType())
    var __t8: Value; // AddressType()
    var __t9: Value; // ByteArrayType()
    var __t10: Reference; // ReferenceType(IntegerType())
    var __t11: Value; // IntegerType()
    var __t12: Value; // ByteArrayType()
    var __t13: Reference; // ReferenceType(IntegerType())
    var __t14: Value; // IntegerType()
    var __t15: Value; // IntegerType()
    var __t16: Value; // IntegerType()
    var __t17: Reference; // ReferenceType(IntegerType())
    var __t18: Value; // ByteArrayType()
    var __t19: Value; // ByteArrayType()
    var __t20: Value; // ByteArrayType()
    var __t21: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#fresh_guid#0#counter: [Position]Value;
    var debug#LibraAccount#fresh_guid#1#sender: [Position]Value;
    var debug#LibraAccount#fresh_guid#2#count: [Position]Value;
    var debug#LibraAccount#fresh_guid#3#count_bytes: [Position]Value;
    var debug#LibraAccount#fresh_guid#4#preimage: [Position]Value;
    var debug#LibraAccount#fresh_guid#5#sender_bytes: [Position]Value;
    var debug#LibraAccount#fresh_guid#6#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 22;
    debug#LibraAccount#fresh_guid#0#counter := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#1#sender := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#2#count := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#3#count_bytes := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#4#preimage := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#5#sender_bytes := EmptyPositionMap;
    debug#LibraAccount#fresh_guid#6#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, counter));
    assume IsValidReferenceParameter(__m, __frame, counter);
    debug#LibraAccount#fresh_guid#0#counter := debug#LibraAccount#fresh_guid#0#counter[Position(21344) := Dereference(__m, counter)];
    assume is#Address(sender);
    __m := UpdateLocal(__m, __frame + 1, sender);
    debug#LibraAccount#fresh_guid#1#sender := debug#LibraAccount#fresh_guid#1#sender[Position(21344) := sender];

    // bytecode translation starts here
    call __t6 := CopyOrMoveRef(counter);

    call __t7 := BorrowField(__t6, LibraAccount_EventHandleGenerator_counter);

    call count := CopyOrMoveRef(__t7);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 8, __tmp);

    call __t9 := AddressUtil_address_to_bytes(GetLocal(__m, __frame + 8));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t9);

    __m := UpdateLocal(__m, __frame + 9, __t9);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 9));
    __m := UpdateLocal(__m, __frame + 5, __tmp);
    debug#LibraAccount#fresh_guid#5#sender_bytes := debug#LibraAccount#fresh_guid#5#sender_bytes[Position(21614) := __tmp];

    call __t10 := CopyOrMoveRef(count);

    call __tmp := ReadRef(__t10);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __t12 := U64Util_u64_to_bytes(GetLocal(__m, __frame + 11));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t12);

    __m := UpdateLocal(__m, __frame + 12, __t12);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 12));
    __m := UpdateLocal(__m, __frame + 3, __tmp);
    debug#LibraAccount#fresh_guid#3#count_bytes := debug#LibraAccount#fresh_guid#3#count_bytes[Position(21682) := __tmp];

    call __t13 := CopyOrMoveRef(count);

    call __tmp := ReadRef(__t13);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call __tmp := AddU64(GetLocal(__m, __frame + 14), GetLocal(__m, __frame + 15));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __t17 := CopyOrMoveRef(count);

    call WriteRef(__t17, GetLocal(__m, __frame + 16));

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 18, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 19, __tmp);

    call __t20 := BytearrayUtil_bytearray_concat(GetLocal(__m, __frame + 18), GetLocal(__m, __frame + 19));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t20);

    __m := UpdateLocal(__m, __frame + 20, __t20);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 20));
    __m := UpdateLocal(__m, __frame + 4, __tmp);
    debug#LibraAccount#fresh_guid#4#preimage := debug#LibraAccount#fresh_guid#4#preimage[Position(21879) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 21, __tmp);

    __ret0 := GetLocal(__m, __frame + 21);
    debug#LibraAccount#fresh_guid#6#__ret := debug#LibraAccount#fresh_guid#6#__ret[Position(21970) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#fresh_guid#6#__ret := debug#LibraAccount#fresh_guid#6#__ret[Position(21997) := __ret0];
}

procedure LibraAccount_fresh_guid_verify (counter: Reference, sender: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_fresh_guid(counter, sender);
}

procedure {:inline 1} LibraAccount_new_event_handle_impl (tv0: TypeValue, counter: Reference, sender: Value) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var __t2: Value; // IntegerType()
    var __t3: Reference; // ReferenceType(LibraAccount_EventHandleGenerator_type_value())
    var __t4: Value; // AddressType()
    var __t5: Value; // ByteArrayType()
    var __t6: Value; // LibraAccount_EventHandle_type_value(tv0)
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#new_event_handle_impl#0#counter: [Position]Value;
    var debug#LibraAccount#new_event_handle_impl#1#sender: [Position]Value;
    var debug#LibraAccount#new_event_handle_impl#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 7;
    debug#LibraAccount#new_event_handle_impl#0#counter := EmptyPositionMap;
    debug#LibraAccount#new_event_handle_impl#1#sender := EmptyPositionMap;
    debug#LibraAccount#new_event_handle_impl#2#__ret := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, counter));
    assume IsValidReferenceParameter(__m, __frame, counter);
    debug#LibraAccount#new_event_handle_impl#0#counter := debug#LibraAccount#new_event_handle_impl#0#counter[Position(22101) := Dereference(__m, counter)];
    assume is#Address(sender);
    __m := UpdateLocal(__m, __frame + 1, sender);
    debug#LibraAccount#new_event_handle_impl#1#sender := debug#LibraAccount#new_event_handle_impl#1#sender[Position(22101) := sender];

    // bytecode translation starts here
    call __tmp := LdConst(0);
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := CopyOrMoveRef(counter);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 4, __tmp);

    call __t5 := LibraAccount_fresh_guid(__t3, GetLocal(__m, __frame + 4));
    if (__abort_flag) { goto Label_Abort; }
    assume is#ByteArray(__t5);

    __m := UpdateLocal(__m, __frame + 5, __t5);

    call __tmp := Pack_LibraAccount_EventHandle(tv0, GetLocal(__m, __frame + 2), GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    __ret0 := GetLocal(__m, __frame + 6);
    debug#LibraAccount#new_event_handle_impl#2#__ret := debug#LibraAccount#new_event_handle_impl#2#__ret[Position(22229) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#new_event_handle_impl#2#__ret := debug#LibraAccount#new_event_handle_impl#2#__ret[Position(22321) := __ret0];
}

procedure LibraAccount_new_event_handle_impl_verify (tv0: TypeValue, counter: Reference, sender: Value) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_new_event_handle_impl(tv0, counter, sender);
}

procedure {:inline 1} LibraAccount_new_event_handle (tv0: TypeValue) returns (__ret0: Value)
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var sender_account_ref: Reference; // ReferenceType(LibraAccount_T_type_value())
    var sender_bytes: Value; // ByteArrayType()
    var __t2: Value; // AddressType()
    var __t3: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t4: Reference; // ReferenceType(LibraAccount_T_type_value())
    var __t5: Reference; // ReferenceType(LibraAccount_EventHandleGenerator_type_value())
    var __t6: Value; // AddressType()
    var __t7: Value; // LibraAccount_EventHandle_type_value(tv0)
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#new_event_handle#0#sender_account_ref: [Position]Value;
    var debug#LibraAccount#new_event_handle#1#sender_bytes: [Position]Value;
    var debug#LibraAccount#new_event_handle#2#__ret: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 8;
    debug#LibraAccount#new_event_handle#0#sender_account_ref := EmptyPositionMap;
    debug#LibraAccount#new_event_handle#1#sender_bytes := EmptyPositionMap;
    debug#LibraAccount#new_event_handle#2#__ret := EmptyPositionMap;

    // process and type check arguments

    // bytecode translation starts here
    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 2, __tmp);

    call __t3 := BorrowGlobal(GetLocal(__m, __frame + 2), LibraAccount_T_type_value());
    if (__abort_flag) { goto Label_Abort; }

    call sender_account_ref := CopyOrMoveRef(__t3);

    call __t4 := CopyOrMoveRef(sender_account_ref);

    call __t5 := BorrowField(__t4, LibraAccount_T_event_generator);

    call __tmp := GetTxnSenderAddress();
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __t7 := LibraAccount_new_event_handle_impl(tv0, __t5, GetLocal(__m, __frame + 6));
    if (__abort_flag) { goto Label_Abort; }
    assume is#Vector(__t7);

    __m := UpdateLocal(__m, __frame + 7, __t7);

    __ret0 := GetLocal(__m, __frame + 7);
    debug#LibraAccount#new_event_handle#2#__ret := debug#LibraAccount#new_event_handle#2#__ret[Position(22670) := __ret0];
    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
    __ret0 := DefaultValue;
    debug#LibraAccount#new_event_handle#2#__ret := debug#LibraAccount#new_event_handle#2#__ret[Position(22779) := __ret0];
}

procedure LibraAccount_new_event_handle_verify (tv0: TypeValue) returns (__ret0: Value)
{
    call InitVerification();
    call __ret0 := LibraAccount_new_event_handle(tv0);
}

procedure {:inline 1} LibraAccount_emit_event (tv0: TypeValue, handle_ref: Reference, msg: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var count: Reference; // ReferenceType(IntegerType())
    var guid: Value; // ByteArrayType()
    var __t4: Reference; // ReferenceType(LibraAccount_EventHandle_type_value(tv0))
    var __t5: Reference; // ReferenceType(ByteArrayType())
    var __t6: Value; // ByteArrayType()
    var __t7: Reference; // ReferenceType(LibraAccount_EventHandle_type_value(tv0))
    var __t8: Reference; // ReferenceType(IntegerType())
    var __t9: Value; // ByteArrayType()
    var __t10: Reference; // ReferenceType(IntegerType())
    var __t11: Value; // IntegerType()
    var __t12: Value; // tv0
    var __t13: Reference; // ReferenceType(IntegerType())
    var __t14: Value; // IntegerType()
    var __t15: Value; // IntegerType()
    var __t16: Value; // IntegerType()
    var __t17: Reference; // ReferenceType(IntegerType())
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#emit_event#0#handle_ref: [Position]Value;
    var debug#LibraAccount#emit_event#1#msg: [Position]Value;
    var debug#LibraAccount#emit_event#2#count: [Position]Value;
    var debug#LibraAccount#emit_event#3#guid: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 18;
    debug#LibraAccount#emit_event#0#handle_ref := EmptyPositionMap;
    debug#LibraAccount#emit_event#1#msg := EmptyPositionMap;
    debug#LibraAccount#emit_event#2#count := EmptyPositionMap;
    debug#LibraAccount#emit_event#3#guid := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(Dereference(__m, handle_ref));
    assume IsValidReferenceParameter(__m, __frame, handle_ref);
    debug#LibraAccount#emit_event#0#handle_ref := debug#LibraAccount#emit_event#0#handle_ref[Position(22958) := Dereference(__m, handle_ref)];
    __m := UpdateLocal(__m, __frame + 1, msg);
    debug#LibraAccount#emit_event#1#msg := debug#LibraAccount#emit_event#1#msg[Position(22958) := msg];

    // bytecode translation starts here
    call __t4 := CopyOrMoveRef(handle_ref);

    call __t5 := BorrowField(__t4, LibraAccount_EventHandle_guid);

    call __tmp := ReadRef(__t5);
    assume is#ByteArray(__tmp);
    __m := UpdateLocal(__m, __frame + 6, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 6));
    __m := UpdateLocal(__m, __frame + 3, __tmp);
    debug#LibraAccount#emit_event#3#guid := debug#LibraAccount#emit_event#3#guid[Position(23108) := __tmp];

    call __t7 := CopyOrMoveRef(handle_ref);

    call __t8 := BorrowField(__t7, LibraAccount_EventHandle_counter);

    call count := CopyOrMoveRef(__t8);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 9, __tmp);

    call __t10 := CopyOrMoveRef(count);

    call __tmp := ReadRef(__t10);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 11, __tmp);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 1));
    __m := UpdateLocal(__m, __frame + 12, __tmp);

    call LibraAccount_write_to_event_store(tv0, GetLocal(__m, __frame + 9), GetLocal(__m, __frame + 11), GetLocal(__m, __frame + 12));
    if (__abort_flag) { goto Label_Abort; }

    call __t13 := CopyOrMoveRef(count);

    call __tmp := ReadRef(__t13);
    assume IsValidU64(__tmp);
    __m := UpdateLocal(__m, __frame + 14, __tmp);

    call __tmp := LdConst(1);
    __m := UpdateLocal(__m, __frame + 15, __tmp);

    call __tmp := AddU64(GetLocal(__m, __frame + 14), GetLocal(__m, __frame + 15));
    if (__abort_flag) { goto Label_Abort; }
    __m := UpdateLocal(__m, __frame + 16, __tmp);

    call __t17 := CopyOrMoveRef(count);

    call WriteRef(__t17, GetLocal(__m, __frame + 16));

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_emit_event_verify (tv0: TypeValue, handle_ref: Reference, msg: Value) returns ()
{
    call InitVerification();
    call LibraAccount_emit_event(tv0, handle_ref, msg);
}

procedure {:inline 1} LibraAccount_write_to_event_store (tv0: TypeValue, guid: Value, count: Value, msg: Value) returns ();
requires ExistsTxnSenderAccount(__m, __txn);

procedure {:inline 1} LibraAccount_destroy_handle (tv0: TypeValue, handle: Value) returns ()
requires ExistsTxnSenderAccount(__m, __txn);
{
    // declare local variables
    var guid: Value; // ByteArrayType()
    var count: Value; // IntegerType()
    var __t3: Value; // LibraAccount_EventHandle_type_value(tv0)
    var __t4: Value; // IntegerType()
    var __t5: Value; // ByteArrayType()
    var __tmp: Value;
    var __frame: int;
    var __saved_m: Memory;
    var debug#LibraAccount#destroy_handle#0#handle: [Position]Value;
    var debug#LibraAccount#destroy_handle#1#guid: [Position]Value;
    var debug#LibraAccount#destroy_handle#2#count: [Position]Value;

    // initialize function execution
    assume !__abort_flag;
    __saved_m := __m;
    __frame := __local_counter;
    __local_counter := __local_counter + 6;
    debug#LibraAccount#destroy_handle#0#handle := EmptyPositionMap;
    debug#LibraAccount#destroy_handle#1#guid := EmptyPositionMap;
    debug#LibraAccount#destroy_handle#2#count := EmptyPositionMap;

    // process and type check arguments
    assume is#Vector(handle);
    __m := UpdateLocal(__m, __frame + 0, handle);
    debug#LibraAccount#destroy_handle#0#handle := debug#LibraAccount#destroy_handle#0#handle[Position(23597) := handle];

    // bytecode translation starts here
    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 0));
    __m := UpdateLocal(__m, __frame + 3, __tmp);

    call __t4, __t5 := Unpack_LibraAccount_EventHandle(GetLocal(__m, __frame + 3));
    __m := UpdateLocal(__m, __frame + 4, __t4);
    __m := UpdateLocal(__m, __frame + 5, __t5);

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 5));
    __m := UpdateLocal(__m, __frame + 1, __tmp);
    debug#LibraAccount#destroy_handle#1#guid := debug#LibraAccount#destroy_handle#1#guid[Position(23752) := __tmp];

    call __tmp := CopyOrMoveValue(GetLocal(__m, __frame + 4));
    __m := UpdateLocal(__m, __frame + 2, __tmp);
    debug#LibraAccount#destroy_handle#2#count := debug#LibraAccount#destroy_handle#2#count[Position(23745) := __tmp];

    return;

Label_Abort:
    __abort_flag := true;
    __m := __saved_m;
}

procedure LibraAccount_destroy_handle_verify (tv0: TypeValue, handle: Value) returns ()
{
    call InitVerification();
    call LibraAccount_destroy_handle(tv0, handle);
}



// ** structs of module TestLib



// ** functions of module TestLib
