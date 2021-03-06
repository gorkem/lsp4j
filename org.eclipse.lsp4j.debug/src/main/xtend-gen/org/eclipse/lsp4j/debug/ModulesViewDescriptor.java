/**
 * Copyright (c) 2017 Kichwa Coders Ltd. and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 */
package org.eclipse.lsp4j.debug;

import java.util.Arrays;
import org.eclipse.lsp4j.debug.ColumnDescriptor;
import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder;

/**
 * The ModulesViewDescriptor is the container for all declarative configuration options of a ModuleView.
 * <p>
 * For now it only specifies the columns to be shown in the modules view.
 */
@SuppressWarnings("all")
public class ModulesViewDescriptor {
  private ColumnDescriptor[] columns;
  
  @Pure
  public ColumnDescriptor[] getColumns() {
    return this.columns;
  }
  
  public void setColumns(final ColumnDescriptor[] columns) {
    this.columns = columns;
  }
  
  @Override
  @Pure
  public String toString() {
    ToStringBuilder b = new ToStringBuilder(this);
    b.add("columns", this.columns);
    return b.toString();
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ModulesViewDescriptor other = (ModulesViewDescriptor) obj;
    if (this.columns == null) {
      if (other.columns != null)
        return false;
    } else if (!Arrays.deepEquals(this.columns, other.columns))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.columns== null) ? 0 : Arrays.deepHashCode(this.columns));
    return result;
  }
}
