using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TestSolution.TestAssembly
{
    public class TestClass
    {
        #region Numbers

        public Byte ByteProperty { get; set; }

        public SByte SByteProperty { get; set; }

        public Int16 Int16Property { get; set; }

        public UInt16 UInt16Property { get; set; }

        public Int32 Int32Property { get; set; }

        public UInt32 UInt32Property { get; set; }

        public Int64 Int64Property { get; set; }

        public UInt64 UInt64Property { get; set; }

        public Decimal DecimalProperty { get; set; }

        public Single SingleProperty { get; set; }

        public Double DoubleProperty { get; set; }

        public int? NullableProperty { get; set; }

        #endregion


        #region Primitives

        public Boolean BooleanProperty { get; set; }

        public Char CharProperty { get; set; }

        public String StringProperty { get; set; }

        public DateTime DateTimeProperty { get; set; }

        #endregion


        #region Collections

        public IDictionary DictionaryProperty { get; set; }

        public IDictionary<string, DateTime> GenericDictionaryProperty { get; set; }

        public IDictionary<DateTime, string> UnsupportedDictionaryProperty { get; set; }

        public IEnumerable CollectionProperty { get; set; }

        public IEnumerable<string> GenericCollectionProperty { get; set; }

        #endregion


        #region Any

        public TimeSpan TimeSpanProperty { get; set; }

        public Object ObjectProperty { get; set; }

        public dynamic DynamicProperty { get; set; }

        #endregion
    }
}