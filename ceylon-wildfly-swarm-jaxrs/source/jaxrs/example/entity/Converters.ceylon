//import java.lang {
//    JByte=Byte,
//    JLong=Long,
//    JDouble=Double,
//    JString=String
//}
//
//import javax.persistence {
//    AttributeConverter,
//    converter
//}
//import javax.xml.bind.annotation.adapters {
//    XmlAdapter
//}
//
//shared class IntegerAdapter()
//        extends XmlAdapter<JLong,Integer>() {
//    unmarshal(JLong? v)
//            => if (exists v)
//            then v.longValue() else null;
//    marshal (Integer? v)
//            => if (exists v)
//            then JLong(v) else null;
//}
//
//shared class StringAdapter()
//        extends XmlAdapter<JString,String>() {
//    unmarshal(JString? v)
//            => if (exists v)
//            then v.string else null;
//    marshal (String? v)
//            => if (exists v)
//            then JString(v) else null;
//}
//
//shared class FloatAdapter()
//        extends XmlAdapter<JDouble,Float>() {
//    unmarshal(JDouble? v)
//            => if (exists v)
//            then v.doubleValue() else null;
//    marshal (Float? v)
//            => if (exists v)
//            then JDouble(v) else null;
//}
//
//shared class ByteAdapter()
//        extends XmlAdapter<JByte,Byte>() {
//    unmarshal(JByte? v)
//            => if (exists v)
//            then v.byteValue() else null;
//    marshal (Byte? v)
//            => if (exists v)
//            then JByte(v) else null;
//}
//
//shared class CharacterAdapter()
//        extends XmlAdapter<JString,Character>() {
//    unmarshal(JString? v)
//            => if (exists v, !v.empty)
//            then v.codePointAt(0).character else null;
//    marshal (Character? v)
//            => if (exists v)
//            then JString(v.string) else null;
//}
//
//converter { autoApply = true; }
//shared class IntegerConverter()
//        satisfies AttributeConverter<Integer, JLong> {
//
//    convertToDatabaseColumn(Integer? int)
//            => if (exists int)
//            then JLong(int) else null;
//
//    convertToEntityAttribute(JLong? jlong)
//            => if (exists jlong)
//            then jlong.longValue() else null;
//
//}
//
//converter { autoApply = true; }
//shared class ByteConverter()
//        satisfies AttributeConverter<Byte, JByte> {
//
//    convertToDatabaseColumn(Byte? byte)
//            => if (exists byte)
//            then JByte(byte) else null;
//
//    convertToEntityAttribute(JByte? jbyte)
//            => if (exists jbyte)
//            then jbyte.byteValue() else null;
//
//}
//
//converter { autoApply = true; }
//shared class FloatConverter()
//        satisfies AttributeConverter<Float, JDouble> {
//
//    convertToDatabaseColumn(Float? float)
//            => if (exists float)
//            then JDouble(float) else null;
//
//    convertToEntityAttribute(JDouble? jdouble)
//            => if (exists jdouble)
//            then jdouble.doubleValue() else null;
//
//}
//
//converter { autoApply = true; }
//shared class StringConverter()
//        satisfies AttributeConverter<String, JString> {
//
//    convertToDatabaseColumn(String? string)
//            => if (exists string)
//            then JString(string) else null;
//
//    convertToEntityAttribute(JString? jstring)
//            => if (exists jstring)
//            then jstring.string else null;
//
//}
//
//converter { autoApply = true; }
//shared class CharacterConverter()
//        satisfies AttributeConverter<Character, JString> {
//
//    convertToDatabaseColumn(Character? character)
//            => if (exists character)
//            then JString(character.string) else null;
//
//    convertToEntityAttribute(JString? jstring)
//            => if (exists jstring, !jstring.empty)
//            then jstring.codePointAt(0).character else null;
//
//}
